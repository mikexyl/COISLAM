/**
* This file is part of ORB-SLAM2.
*
* Copyright (C) 2014-2016 Raúl Mur-Artal <raulmur at unizar dot es> (University of Zaragoza)
* For more information see <https://github.com/raulmur/ORB_SLAM2>
*
* ORB-SLAM2 is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* ORB-SLAM2 is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with ORB-SLAM2. If not, see <http://www.gnu.org/licenses/>.
*/

#include "KeyFrameDatabase.h"

#include "KeyFrame.h"
#include "Thirdparty/DBoW2/DBoW2/BowVector.h"

#include<mutex>


using namespace std;

namespace ORB_SLAM2 {
ofstream kfdLog("kfd.txt");
    KeyFrameDatabase::KeyFrameDatabase(const ORBVocabulary &voc) :
            mpVoc(&voc) {
        mvInvertedFile.resize(voc.size());
    }

    KeyFrameDatabase::KeyFrameDatabase(const ORBVocabulary &voc, const ORBVocabulary &iivoc) :
            mpVoc(&voc), mpIIVoc(&iivoc) {
              // cout<<"test in KeyFrameDatabase{} "<<mpIIVoc->size()<<endl;
              // cout<<"test in KeyFrameDatabase{} "<<mpIIVoc<<endl;
              // cout<<"test in KeyFrameDatabase{} "<<mpVoc->size()<<endl;
              mvInvertedFile.resize(voc.size());
              mvIIInvertedFile.resize(iivoc.size());
              cout<<mpIIVoc->size()<<endl;
    }

    void KeyFrameDatabase::add(KeyFrame *pKF) {
        unique_lock<mutex> lock(mMutex);

        for (DBoW2::BowVector::const_iterator vit = pKF->mBowVec.begin(), vend = pKF->mBowVec.end();
             vit != vend; vit++) {
            LightKeyFrame tLKF(pKF);
            mvInvertedFile[vit->first].push_back(tLKF);
        }

        for (DBoW2::BowVector::const_iterator vit = pKF->mIIBowVec.begin(), vend = pKF->mIIBowVec.end();
             vit != vend; vit++) {
            LightKeyFrame tLKF(pKF);
            mvInvertedFile[vit->first].push_back(tLKF);
        }
    }

    void KeyFrameDatabase::erase(KeyFrame *pKF) {
        unique_lock<mutex> lock(mMutex);
        LightKeyFrame tLKF(pKF);
        // Erase elements in the Inverse File for the entry
        for (DBoW2::BowVector::const_iterator vit = pKF->mBowVec.begin(), vend = pKF->mBowVec.end();
             vit != vend; vit++) {
            // List of keyframes that share the word
            list<LightKeyFrame> &lLKFs = mvInvertedFile[vit->first];

            for (list<LightKeyFrame>::iterator lit = lLKFs.begin(), lend = lLKFs.end(); lit != lend; lit++) {

                if (tLKF == *lit) {
                    lLKFs.erase(lit);
                    break;
                }
            }
        }

        for (DBoW2::BowVector::const_iterator vit = pKF->mIIBowVec.begin(), vend = pKF->mIIBowVec.end();
             vit != vend; vit++) {
            // List of keyframes that share the word
            list<LightKeyFrame> &lLKFs = mvInvertedFile[vit->first];

            for (list<LightKeyFrame>::iterator lit = lLKFs.begin(), lend = lLKFs.end(); lit != lend; lit++) {

                if (tLKF == *lit) {
                    lLKFs.erase(lit);
                    break;
                }
            }
        }
    }

    void KeyFrameDatabase::clear() {
      // cout<<"test in KeyFrameDatabase::clear loc 1"<<endl;
      //cout<<"test ii invertedfile "<<mpIIVoc<<endl;

        mvInvertedFile.clear();
        // cout<<"test in KeyFrameDatabase::clear loc 2"<<endl;

        mvInvertedFile.resize(mpVoc->size());
        // cout<<"test in KeyFrameDatabase::clear loc 3"<<endl;
    }


    vector<KeyFrame *> KeyFrameDatabase::DetectLoopCandidates(KeyFrame *pKF, float minScore) {
        set<KeyFrame *> spConnectedKeyFrames = pKF->GetConnectedKeyFrames();
        list<KeyFrame *> lKFsSharingWords;

        // Search all keyframes that share a word with current keyframes
        // Discard keyframes connected to the query keyframe
        {
            unique_lock<mutex> lock(mMutex);

            for (DBoW2::BowVector::const_iterator vit = pKF->mBowVec.begin(), vend = pKF->mBowVec.end();
                 vit != vend; vit++) {
                list<LightKeyFrame> &lKFs = mvInvertedFile[vit->first];

                for (list<LightKeyFrame>::iterator lit = lKFs.begin(), lend = lKFs.end(); lit != lend; lit++) {
                    KeyFrame *pKFi = (*lit).getKeyFrame();
                    if( pKFi ) {
                        if (pKFi->mnLoopQuery != pKF->mnId) {
                            pKFi->mnLoopWords = 0;
                            if (!spConnectedKeyFrames.count(pKFi)) {
                                pKFi->mnLoopQuery = pKF->mnId;
                                lKFsSharingWords.push_back(pKFi);
                            }
                        }
                        pKFi->mnLoopWords++;
                    }

                }
            }
        }

        if (lKFsSharingWords.empty())
            return vector<KeyFrame *>();

            list<pair<float, KeyFrame *> > lScoreAndMatch;
            list<pair<float, KeyFrame *> > lIIScoreAndMatch;

        // Only compare against those keyframes that share enough words
        int maxCommonWords = 0;
        for (list<KeyFrame *>::iterator lit = lKFsSharingWords.begin(), lend = lKFsSharingWords.end();
             lit != lend; lit++) {
            if ((*lit)->mnLoopWords > maxCommonWords)
                maxCommonWords = (*lit)->mnLoopWords;
        }

        int minCommonWords = maxCommonWords * 0.8f;

        int nscores = 0;

        // Compute similarity score. Retain the matches whose score is higher than minScore
        for (list<KeyFrame *>::iterator lit = lKFsSharingWords.begin(), lend = lKFsSharingWords.end();
             lit != lend; lit++) {
            KeyFrame *pKFi = *lit;

            if (pKFi->mnLoopWords > minCommonWords) {
                nscores++;

                float si = mpVoc->score(pKF->mBowVec, pKFi->mBowVec);

                // float sii=mpIIVoc->score(pKF->mIIBowVec, pKFi->mIIBowVec);
                pKFi->mLoopScore = si;
                if (si >= minScore)
                    lScoreAndMatch.push_back(make_pair(si, pKFi));
                // else if (sii>=minScore)
                //     lIIScoreAndMatch.push_back(make_pair(sii, pKFi));
            }
        }

        vector<KeyFrame *> vpLoopCandidates=CandidateFilter(pKF, minScore,0.75, minCommonWords, lScoreAndMatch);

        return vpLoopCandidates;
    }

    vector<KeyFrame*> KeyFrameDatabase::DetectMapFusionCandidatesFromDB(KeyFrame *pKF, bool ifII) {

        list<KeyFrame *> lKFsSharingWords;

        // Search all keyframes that share a word with current frame
        {
            unique_lock<mutex> lock(mMutex);

            if(!ifII){
            for (DBoW2::BowVector::const_iterator vit = pKF->mBowVec.begin(), vend = pKF->mBowVec.end();
                 vit != vend; vit++) {
                list<LightKeyFrame> &lKFs = mvInvertedFile[vit->first];

                for (list<LightKeyFrame>::iterator lit = lKFs.begin(), lend = lKFs.end(); lit != lend; lit++) {
                    KeyFrame *pKFi = (*lit).getKeyFrame();
                    if( pKFi ) {
                        if (pKFi->mnRelocQuery != pKF->mnId) {
                            pKFi->mnRelocWords = 0;
                            pKFi->mnRelocQuery = pKF->mnId;
                            lKFsSharingWords.push_back(pKFi);
                        }
                        pKFi->mnRelocWords++;
                    }
                }
            }
            kfdLog<<"KFD pKF.mIIBowVec.size()"<<pKF->mBowVec.size()<<" "<<endl;
            kfdLog<<"KFD lKFsSharingWords.size="<<lKFsSharingWords.size()<<endl;

          }
          else {
            for (DBoW2::BowVector::const_iterator vit = pKF->mIIBowVec.begin(), vend = pKF->mIIBowVec.end();
                 vit != vend; vit++) {
                   // list<LightKeyFrame> &lKFs = mvIIInvertedFile[vit->first];
                   list<LightKeyFrame> &lKFs = mvInvertedFile[vit->first];

                for (list<LightKeyFrame>::iterator lit = lKFs.begin(), lend = lKFs.end(); lit != lend; lit++) {
                    KeyFrame *pKFi = (*lit).getKeyFrame();
                    if( pKFi ) {
                        if (pKFi->mnRelocQuery != pKF->mnId) {
                            pKFi->mnRelocWords = 0;
                            pKFi->mnRelocQuery = pKF->mnId;
                            lKFsSharingWords.push_back(pKFi);
                        }
                        pKFi->mnRelocWords++;
                    }
                }

            }
            kfdLog<<"KFD II pKF.mIIBowVec.size()"<<pKF->mIIBowVec.size()<<" "<<endl;
            kfdLog<<"KFD II lKFsSharingWords.size="<<lKFsSharingWords.size()<<endl;
          }
        }

        if (lKFsSharingWords.empty())
            return vector<KeyFrame *>();

        // Only compare against those keyframes that share enough words
        int maxCommonWords = 0;
        for (list<KeyFrame *>::iterator lit = lKFsSharingWords.begin(), lend = lKFsSharingWords.end();
             lit != lend; lit++) {
            if ((*lit)->mnRelocWords > maxCommonWords)
                maxCommonWords = (*lit)->mnRelocWords;
        }

        int minCommonWords = maxCommonWords * 0.8f;

        list<pair<float, KeyFrame *> > lScoreAndMatch;

        int nscores = 0;

        // Compute similarity score.
        for (list<KeyFrame *>::iterator lit = lKFsSharingWords.begin(), lend = lKFsSharingWords.end();
             lit != lend; lit++) {
            KeyFrame *pKFi = *lit;

            if (pKFi->mnRelocWords > minCommonWords) {
                nscores++;
                float si;
                  si = mpVoc->score(pKF->mBowVec, pKFi->mBowVec);

                pKFi->mRelocScore = si;
                lScoreAndMatch.push_back(make_pair(si, pKFi));
            }
        }

        vector<KeyFrame *> vpRelocCandidates=CandidateFilter(pKF, 0, 0.75, minCommonWords, lScoreAndMatch);

        return vpRelocCandidates;

    }

    vector<KeyFrame *> KeyFrameDatabase::DetectRelocalizationCandidates(Frame *F) {
        list<KeyFrame *> lKFsSharingWords;

        // Search all keyframes that share a word with current frame
        {
            unique_lock<mutex> lock(mMutex);

            for (DBoW2::BowVector::const_iterator vit = F->mBowVec.begin(), vend = F->mBowVec.end();
                 vit != vend; vit++) {
                list<LightKeyFrame> &lKFs = mvInvertedFile[vit->first];

                for (list<LightKeyFrame>::iterator lit = lKFs.begin(), lend = lKFs.end(); lit != lend; lit++) {
                    KeyFrame *pKFi = (*lit).getKeyFrame();
                    if( pKFi ) {
                        if (pKFi->mnRelocQuery != F->mnId) {
                            pKFi->mnRelocWords = 0;
                            pKFi->mnRelocQuery = F->mnId;
                            lKFsSharingWords.push_back(pKFi);
                        }
                        pKFi->mnRelocWords++;
                    }
                }
            }
        }
        if (lKFsSharingWords.empty())
            return vector<KeyFrame *>();

        // Only compare against those keyframes that share enough words
        int maxCommonWords = 0;
        for (list<KeyFrame *>::iterator lit = lKFsSharingWords.begin(), lend = lKFsSharingWords.end();
             lit != lend; lit++) {
            if ((*lit)->mnRelocWords > maxCommonWords)
                maxCommonWords = (*lit)->mnRelocWords;
        }

        int minCommonWords = maxCommonWords * 0.8f;

        list<pair<float, KeyFrame *> > lScoreAndMatch;

        int nscores = 0;

        // Compute similarity score.
        for (list<KeyFrame *>::iterator lit = lKFsSharingWords.begin(), lend = lKFsSharingWords.end();
             lit != lend; lit++) {
            KeyFrame *pKFi = *lit;

            if (pKFi->mnRelocWords > minCommonWords) {
                nscores++;
                float si = mpVoc->score(F->mBowVec, pKFi->mBowVec);

                pKFi->mRelocScore = si;
                lScoreAndMatch.push_back(make_pair(si, pKFi));
            }
        }

        if (lScoreAndMatch.empty())
            return vector<KeyFrame *>();

        list<pair<float, KeyFrame *> > lAccScoreAndMatch;
        float bestAccScore = 0;

        // Lets now accumulate score by covisibility
        for (list<pair<float, KeyFrame *> >::iterator it = lScoreAndMatch.begin(), itend = lScoreAndMatch.end();
             it != itend; it++) {
            KeyFrame *pKFi = it->second;
            vector<KeyFrame *> vpNeighs = pKFi->GetBestCovisibilityKeyFrames(10);

            float bestScore = it->first;
            float accScore = bestScore;
            KeyFrame *pBestKF = pKFi;
            for (vector<KeyFrame *>::iterator vit = vpNeighs.begin(), vend = vpNeighs.end(); vit != vend; vit++) {
                KeyFrame *pKF2 = *vit;
                if (pKF2->mnRelocQuery != F->mnId)
                    continue;

                accScore += pKF2->mRelocScore;
                if (pKF2->mRelocScore > bestScore) {
                    pBestKF = pKF2;
                    bestScore = pKF2->mRelocScore;
                }

            }
            lAccScoreAndMatch.push_back(make_pair(accScore, pBestKF));
            if (accScore > bestAccScore)
                bestAccScore = accScore;
        }

        // Return all those keyframes with a score higher than 0.75*bestScore
        float minScoreToRetain = 0.75f * bestAccScore;
        set<KeyFrame *> spAlreadyAddedKF;
        vector<KeyFrame *> vpRelocCandidates;
        vpRelocCandidates.reserve(lAccScoreAndMatch.size());
        for (list<pair<float, KeyFrame *> >::iterator it = lAccScoreAndMatch.begin(), itend = lAccScoreAndMatch.end();
             it != itend; it++) {
            const float &si = it->first;
            if (si > minScoreToRetain) {
                KeyFrame *pKFi = it->second;
                if (!spAlreadyAddedKF.count(pKFi)) {
                    vpRelocCandidates.push_back(pKFi);
                    spAlreadyAddedKF.insert(pKFi);
                }
            }
        }

        return vpRelocCandidates;
    }

    vector<KeyFrame *>  KeyFrameDatabase::CandidateFilter(KeyFrame *pKF, float minScore, float minRatio,int minCommonWords,list<pair<float, KeyFrame *> > lScoreAndMatch){
      if (lScoreAndMatch.empty())
          return vector<KeyFrame *>();

      list<pair<float, KeyFrame *> > lAccScoreAndMatch;
      float bestAccScore = minScore;

      // Lets now accumulate score by covisibility
      for (list<pair<float, KeyFrame *> >::iterator it = lScoreAndMatch.begin(), itend = lScoreAndMatch.end();
           it != itend; it++) {
          KeyFrame *pKFi = it->second;
          vector<KeyFrame *> vpNeighs = pKFi->GetBestCovisibilityKeyFrames(10);

          float bestScore = it->first;
          float accScore = it->first;
          KeyFrame *pBestKF = pKFi;
          for (vector<KeyFrame *>::iterator vit = vpNeighs.begin(), vend = vpNeighs.end(); vit != vend; vit++) {
              KeyFrame *pKF2 = *vit;
              if (pKF2->mnLoopQuery == pKF->mnId && pKF2->mnLoopWords > minCommonWords) {
                  accScore += pKF2->mLoopScore;
                  if (pKF2->mLoopScore > bestScore) {
                      pBestKF = pKF2;
                      bestScore = pKF2->mLoopScore;
                  }
              }
          }

          lAccScoreAndMatch.push_back(make_pair(accScore, pBestKF));
          if (accScore > bestAccScore)
              bestAccScore = accScore;
      }

      // Return all those keyframes with a score higher than 0.75*bestScore
      float minScoreToRetain = minRatio * bestAccScore;

      set<KeyFrame *> spAlreadyAddedKF;
      vector<KeyFrame *> vpLoopCandidates;
      vpLoopCandidates.reserve(lAccScoreAndMatch.size());

      for (list<pair<float, KeyFrame *> >::iterator it = lAccScoreAndMatch.begin(), itend = lAccScoreAndMatch.end();
           it != itend; it++) {
             kfdLog<<"test scores: "<<it->first<<" "<<bestAccScore<<" "<<(float)it->first/bestAccScore<<endl;
          if (it->first > minScoreToRetain) {
              KeyFrame *pKFi = it->second;
              if (!spAlreadyAddedKF.count(pKFi)) {
                  vpLoopCandidates.push_back(pKFi);
                  spAlreadyAddedKF.insert(pKFi);
              }
          }
      }


      return vpLoopCandidates;
    }


} //namespace ORB_SLAM

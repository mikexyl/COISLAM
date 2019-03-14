//
// Created by lifu on 6/8/17.
//

#include "ServerMap.h"

namespace CORBSLAM_SERVER{

    ServerMap::ServerMap() {

    }

    ServerMap::ServerMap(Cache *tCache, Map *tMap) {

        this->pCacher = tCache;
        this->pMap = tMap;

    }

    std::vector<KeyFrame*> ServerMap::DetectMapFusionCandidatesFromDB(KeyFrame *tKF, bool ifII) {

        // get the map candidates from the serverMap in tKF using DBoW method
        std::vector<KeyFrame*> cands;

        cands = this->pCacher->mpKeyFrameDatabase->DetectMapFusionCandidatesFromDB( tKF, ifII );

        return cands;

    }

    void ServerMap::clear() {
      // cout<<"test in servermap::clear loc 1"<<endl;
        this->pMap->clear();
        // cout<<"test in servermap::clear loc 2"<<endl;

        this->pCacher->clearKeyframeDatabase();
        // cout<<"test in servermap::clear loc 3"<<endl;

        mspKeyFramesRecal.clear();


    }

    std::vector<KeyFrame *> ServerMap::GetKeyFramesRecal(){
      return std::vector<KeyFrame *>(mspKeyFramesRecal.begin(), mspKeyFramesRecal.end());
    }



}

//
// Created by lifu on 6/8/17.
//

#ifndef PROJECT_SERVERMAP_H
#define PROJECT_SERVERMAP_H

#include "include/KeyFrame.h"
#include "include/MapPoint.h"
#include "include/Cache.h"
#include "include/Map.h"
#include "include/Converter.h"


using namespace ORB_SLAM2;

namespace CORBSLAM_SERVER{


    class ServerMap {

    public:

        ServerMap();

        ServerMap( Cache * tCache, Map * tMap );

        std::vector<KeyFrame*> DetectMapFusionCandidatesFromDB(KeyFrame * tKF, bool ifII=false);

        void clear();

    public:

        Cache * pCacher;

        Map * pMap;


//custom code
public:
  std::set<KeyFrame *> mspKeyFramesRecal;

  std::vector<KeyFrame *> GetKeyFramesRecal();
    };
}


#endif //PROJECT_SERVERMAP_H

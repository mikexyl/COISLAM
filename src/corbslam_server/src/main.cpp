//
// Created by lifu on 2017/6/4.
//

#include<iostream>
#include<algorithm>
#include<fstream>
#include<chrono>
#include <future>

#include <ros/ros.h>
#include <cv_bridge/cv_bridge.h>
#include <message_filters/subscriber.h>
#include <message_filters/time_synchronizer.h>
#include <message_filters/sync_policies/approximate_time.h>

#include<opencv2/core/core.hpp>
#include <thread>

#include "MapFusion.h"
#include "ServerMap.h"

using namespace std;

using namespace CORBSLAM_SERVER;

int asyncProc(int argc, char **argv, MapFusion *mapfusion){
    // MapFusion& mapfusion = *mapfusionPtr;

    ros::start();
    ROS_INFO("Corbslam_server start!");


    ros::NodeHandle n;

    ros::ServiceServer InsertKeyFrameService = n.advertiseService("insertKeyFrameToMap", &MapFusion::insertKeyFrameToMap, mapfusion );

    ros::ServiceServer InsertMapPointService = n.advertiseService("insertMapPointToMap", &MapFusion::insertMapPointToMap, mapfusion);

    ros::ServiceServer updateKeyFrameToMapService = n.advertiseService("updateKeyFrameToMap", &MapFusion::updateKeyFrameToMap, mapfusion);

    ros::ServiceServer updateMapPointToMapService = n.advertiseService("updateMapPointToMap", &MapFusion::updateMapPointToMap, mapfusion);

    ROS_INFO("Publish services finished !");

    std::thread * mapFuisonThread = new thread(&MapFusion::fuseSubMapToMap, mapfusion);
    // std::thread * IImapFuisonThread = new thread(&MapFusion::IIfuseSubMapToMap, mapfusion);

    // publish update keyframe and mappoint poses topic
    std::thread * pubThread = new thread(&MapFusion::runPubTopic, mapfusion);

    // wait to get subcribe new keyframes or new mappoints
    ros::MultiThreadedSpinner spinner(2);

    spinner.spin();

    // Stop all threads

    // Save camera trajectory

    ros::shutdown();

    return 0;
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "Corbslam_server");

    if( argc != 4) {
        cout << "param: orbvoc setting iivoc\n";
        return false;
    }


    // Create MapFusion system. It initializes all system threads and gets ready to process frames.

    std::string strSettingPath = argv[2];

    MapFusion* mapfusion = new MapFusion( strSettingPath );

    mapfusion->loadORBVocabulary( argv[1] );

    // mapfusion->loadIIVocabulary( argv[3] );
    cout<<string(argv[3])<<endl;
    mapfusion->createKeyFrameDatabase();

    auto resultFuture = async(launch::async, asyncProc, argc, argv, mapfusion);

    mapfusion->RunViewer();

    return resultFuture.get();

    // return 0;

}

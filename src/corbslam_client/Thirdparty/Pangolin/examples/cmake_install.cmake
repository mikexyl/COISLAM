# Install script for directory: /home/xiangyu/Library/CORB-SLAM/src/corbslam_client/Thirdparty/Pangolin/examples

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/xiangyu/Library/CORB-SLAM/src/corbslam_client/Thirdparty/Pangolin/examples/HelloPangolin/cmake_install.cmake")
  include("/home/xiangyu/Library/CORB-SLAM/src/corbslam_client/Thirdparty/Pangolin/examples/SimpleMultiDisplay/cmake_install.cmake")
  include("/home/xiangyu/Library/CORB-SLAM/src/corbslam_client/Thirdparty/Pangolin/examples/SimpleDisplayImage/cmake_install.cmake")
  include("/home/xiangyu/Library/CORB-SLAM/src/corbslam_client/Thirdparty/Pangolin/examples/SimpleScene/cmake_install.cmake")
  include("/home/xiangyu/Library/CORB-SLAM/src/corbslam_client/Thirdparty/Pangolin/examples/SimplePlot/cmake_install.cmake")
  include("/home/xiangyu/Library/CORB-SLAM/src/corbslam_client/Thirdparty/Pangolin/examples/SimpleDisplay/cmake_install.cmake")
  include("/home/xiangyu/Library/CORB-SLAM/src/corbslam_client/Thirdparty/Pangolin/examples/SimpleVideo/cmake_install.cmake")
  include("/home/xiangyu/Library/CORB-SLAM/src/corbslam_client/Thirdparty/Pangolin/examples/SimpleRecord/cmake_install.cmake")
  include("/home/xiangyu/Library/CORB-SLAM/src/corbslam_client/Thirdparty/Pangolin/examples/SimpleRepeatVideo/cmake_install.cmake")
  include("/home/xiangyu/Library/CORB-SLAM/src/corbslam_client/Thirdparty/Pangolin/examples/SharedMemoryVideoWriter/cmake_install.cmake")

endif()


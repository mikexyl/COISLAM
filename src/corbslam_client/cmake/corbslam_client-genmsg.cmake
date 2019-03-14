# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "corbslam_client: 1 messages, 2 services")

set(MSG_I_FLAGS "-Icorbslam_client:/home/xiangyu/Library/CORB-SLAM/src/corbslam_client/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(corbslam_client_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/xiangyu/Library/CORB-SLAM/src/corbslam_client/srv/corbslam_update.srv" NAME_WE)
add_custom_target(_corbslam_client_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "corbslam_client" "/home/xiangyu/Library/CORB-SLAM/src/corbslam_client/srv/corbslam_update.srv" ""
)

get_filename_component(_filename "/home/xiangyu/Library/CORB-SLAM/src/corbslam_client/msg/corbslam_message.msg" NAME_WE)
add_custom_target(_corbslam_client_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "corbslam_client" "/home/xiangyu/Library/CORB-SLAM/src/corbslam_client/msg/corbslam_message.msg" ""
)

get_filename_component(_filename "/home/xiangyu/Library/CORB-SLAM/src/corbslam_client/srv/corbslam_insert.srv" NAME_WE)
add_custom_target(_corbslam_client_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "corbslam_client" "/home/xiangyu/Library/CORB-SLAM/src/corbslam_client/srv/corbslam_insert.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(corbslam_client
  "/home/xiangyu/Library/CORB-SLAM/src/corbslam_client/msg/corbslam_message.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/corbslam_client
)

### Generating Services
_generate_srv_cpp(corbslam_client
  "/home/xiangyu/Library/CORB-SLAM/src/corbslam_client/srv/corbslam_update.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/corbslam_client
)
_generate_srv_cpp(corbslam_client
  "/home/xiangyu/Library/CORB-SLAM/src/corbslam_client/srv/corbslam_insert.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/corbslam_client
)

### Generating Module File
_generate_module_cpp(corbslam_client
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/corbslam_client
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(corbslam_client_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(corbslam_client_generate_messages corbslam_client_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/xiangyu/Library/CORB-SLAM/src/corbslam_client/srv/corbslam_update.srv" NAME_WE)
add_dependencies(corbslam_client_generate_messages_cpp _corbslam_client_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xiangyu/Library/CORB-SLAM/src/corbslam_client/msg/corbslam_message.msg" NAME_WE)
add_dependencies(corbslam_client_generate_messages_cpp _corbslam_client_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xiangyu/Library/CORB-SLAM/src/corbslam_client/srv/corbslam_insert.srv" NAME_WE)
add_dependencies(corbslam_client_generate_messages_cpp _corbslam_client_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(corbslam_client_gencpp)
add_dependencies(corbslam_client_gencpp corbslam_client_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS corbslam_client_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(corbslam_client
  "/home/xiangyu/Library/CORB-SLAM/src/corbslam_client/msg/corbslam_message.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/corbslam_client
)

### Generating Services
_generate_srv_eus(corbslam_client
  "/home/xiangyu/Library/CORB-SLAM/src/corbslam_client/srv/corbslam_update.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/corbslam_client
)
_generate_srv_eus(corbslam_client
  "/home/xiangyu/Library/CORB-SLAM/src/corbslam_client/srv/corbslam_insert.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/corbslam_client
)

### Generating Module File
_generate_module_eus(corbslam_client
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/corbslam_client
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(corbslam_client_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(corbslam_client_generate_messages corbslam_client_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/xiangyu/Library/CORB-SLAM/src/corbslam_client/srv/corbslam_update.srv" NAME_WE)
add_dependencies(corbslam_client_generate_messages_eus _corbslam_client_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xiangyu/Library/CORB-SLAM/src/corbslam_client/msg/corbslam_message.msg" NAME_WE)
add_dependencies(corbslam_client_generate_messages_eus _corbslam_client_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xiangyu/Library/CORB-SLAM/src/corbslam_client/srv/corbslam_insert.srv" NAME_WE)
add_dependencies(corbslam_client_generate_messages_eus _corbslam_client_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(corbslam_client_geneus)
add_dependencies(corbslam_client_geneus corbslam_client_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS corbslam_client_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(corbslam_client
  "/home/xiangyu/Library/CORB-SLAM/src/corbslam_client/msg/corbslam_message.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/corbslam_client
)

### Generating Services
_generate_srv_lisp(corbslam_client
  "/home/xiangyu/Library/CORB-SLAM/src/corbslam_client/srv/corbslam_update.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/corbslam_client
)
_generate_srv_lisp(corbslam_client
  "/home/xiangyu/Library/CORB-SLAM/src/corbslam_client/srv/corbslam_insert.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/corbslam_client
)

### Generating Module File
_generate_module_lisp(corbslam_client
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/corbslam_client
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(corbslam_client_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(corbslam_client_generate_messages corbslam_client_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/xiangyu/Library/CORB-SLAM/src/corbslam_client/srv/corbslam_update.srv" NAME_WE)
add_dependencies(corbslam_client_generate_messages_lisp _corbslam_client_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xiangyu/Library/CORB-SLAM/src/corbslam_client/msg/corbslam_message.msg" NAME_WE)
add_dependencies(corbslam_client_generate_messages_lisp _corbslam_client_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xiangyu/Library/CORB-SLAM/src/corbslam_client/srv/corbslam_insert.srv" NAME_WE)
add_dependencies(corbslam_client_generate_messages_lisp _corbslam_client_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(corbslam_client_genlisp)
add_dependencies(corbslam_client_genlisp corbslam_client_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS corbslam_client_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(corbslam_client
  "/home/xiangyu/Library/CORB-SLAM/src/corbslam_client/msg/corbslam_message.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/corbslam_client
)

### Generating Services
_generate_srv_nodejs(corbslam_client
  "/home/xiangyu/Library/CORB-SLAM/src/corbslam_client/srv/corbslam_update.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/corbslam_client
)
_generate_srv_nodejs(corbslam_client
  "/home/xiangyu/Library/CORB-SLAM/src/corbslam_client/srv/corbslam_insert.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/corbslam_client
)

### Generating Module File
_generate_module_nodejs(corbslam_client
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/corbslam_client
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(corbslam_client_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(corbslam_client_generate_messages corbslam_client_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/xiangyu/Library/CORB-SLAM/src/corbslam_client/srv/corbslam_update.srv" NAME_WE)
add_dependencies(corbslam_client_generate_messages_nodejs _corbslam_client_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xiangyu/Library/CORB-SLAM/src/corbslam_client/msg/corbslam_message.msg" NAME_WE)
add_dependencies(corbslam_client_generate_messages_nodejs _corbslam_client_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xiangyu/Library/CORB-SLAM/src/corbslam_client/srv/corbslam_insert.srv" NAME_WE)
add_dependencies(corbslam_client_generate_messages_nodejs _corbslam_client_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(corbslam_client_gennodejs)
add_dependencies(corbslam_client_gennodejs corbslam_client_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS corbslam_client_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(corbslam_client
  "/home/xiangyu/Library/CORB-SLAM/src/corbslam_client/msg/corbslam_message.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/corbslam_client
)

### Generating Services
_generate_srv_py(corbslam_client
  "/home/xiangyu/Library/CORB-SLAM/src/corbslam_client/srv/corbslam_update.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/corbslam_client
)
_generate_srv_py(corbslam_client
  "/home/xiangyu/Library/CORB-SLAM/src/corbslam_client/srv/corbslam_insert.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/corbslam_client
)

### Generating Module File
_generate_module_py(corbslam_client
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/corbslam_client
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(corbslam_client_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(corbslam_client_generate_messages corbslam_client_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/xiangyu/Library/CORB-SLAM/src/corbslam_client/srv/corbslam_update.srv" NAME_WE)
add_dependencies(corbslam_client_generate_messages_py _corbslam_client_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xiangyu/Library/CORB-SLAM/src/corbslam_client/msg/corbslam_message.msg" NAME_WE)
add_dependencies(corbslam_client_generate_messages_py _corbslam_client_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xiangyu/Library/CORB-SLAM/src/corbslam_client/srv/corbslam_insert.srv" NAME_WE)
add_dependencies(corbslam_client_generate_messages_py _corbslam_client_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(corbslam_client_genpy)
add_dependencies(corbslam_client_genpy corbslam_client_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS corbslam_client_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/corbslam_client)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/corbslam_client
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(corbslam_client_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/corbslam_client)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/corbslam_client
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(corbslam_client_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/corbslam_client)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/corbslam_client
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(corbslam_client_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/corbslam_client)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/corbslam_client
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(corbslam_client_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/corbslam_client)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/corbslam_client\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/corbslam_client
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(corbslam_client_generate_messages_py std_msgs_generate_messages_py)
endif()

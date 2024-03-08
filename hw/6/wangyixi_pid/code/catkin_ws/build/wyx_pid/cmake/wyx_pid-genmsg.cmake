# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "wyx_pid: 1 messages, 0 services")

set(MSG_I_FLAGS "-Iwyx_pid:/home/ethylene/catkin_ws/src/wyx_pid/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(wyx_pid_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/ethylene/catkin_ws/src/wyx_pid/msg/scan_range.msg" NAME_WE)
add_custom_target(_wyx_pid_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wyx_pid" "/home/ethylene/catkin_ws/src/wyx_pid/msg/scan_range.msg" "std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(wyx_pid
  "/home/ethylene/catkin_ws/src/wyx_pid/msg/scan_range.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wyx_pid
)

### Generating Services

### Generating Module File
_generate_module_cpp(wyx_pid
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wyx_pid
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(wyx_pid_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(wyx_pid_generate_messages wyx_pid_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ethylene/catkin_ws/src/wyx_pid/msg/scan_range.msg" NAME_WE)
add_dependencies(wyx_pid_generate_messages_cpp _wyx_pid_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(wyx_pid_gencpp)
add_dependencies(wyx_pid_gencpp wyx_pid_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS wyx_pid_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(wyx_pid
  "/home/ethylene/catkin_ws/src/wyx_pid/msg/scan_range.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wyx_pid
)

### Generating Services

### Generating Module File
_generate_module_eus(wyx_pid
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wyx_pid
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(wyx_pid_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(wyx_pid_generate_messages wyx_pid_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ethylene/catkin_ws/src/wyx_pid/msg/scan_range.msg" NAME_WE)
add_dependencies(wyx_pid_generate_messages_eus _wyx_pid_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(wyx_pid_geneus)
add_dependencies(wyx_pid_geneus wyx_pid_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS wyx_pid_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(wyx_pid
  "/home/ethylene/catkin_ws/src/wyx_pid/msg/scan_range.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wyx_pid
)

### Generating Services

### Generating Module File
_generate_module_lisp(wyx_pid
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wyx_pid
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(wyx_pid_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(wyx_pid_generate_messages wyx_pid_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ethylene/catkin_ws/src/wyx_pid/msg/scan_range.msg" NAME_WE)
add_dependencies(wyx_pid_generate_messages_lisp _wyx_pid_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(wyx_pid_genlisp)
add_dependencies(wyx_pid_genlisp wyx_pid_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS wyx_pid_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(wyx_pid
  "/home/ethylene/catkin_ws/src/wyx_pid/msg/scan_range.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/wyx_pid
)

### Generating Services

### Generating Module File
_generate_module_nodejs(wyx_pid
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/wyx_pid
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(wyx_pid_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(wyx_pid_generate_messages wyx_pid_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ethylene/catkin_ws/src/wyx_pid/msg/scan_range.msg" NAME_WE)
add_dependencies(wyx_pid_generate_messages_nodejs _wyx_pid_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(wyx_pid_gennodejs)
add_dependencies(wyx_pid_gennodejs wyx_pid_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS wyx_pid_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(wyx_pid
  "/home/ethylene/catkin_ws/src/wyx_pid/msg/scan_range.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wyx_pid
)

### Generating Services

### Generating Module File
_generate_module_py(wyx_pid
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wyx_pid
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(wyx_pid_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(wyx_pid_generate_messages wyx_pid_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ethylene/catkin_ws/src/wyx_pid/msg/scan_range.msg" NAME_WE)
add_dependencies(wyx_pid_generate_messages_py _wyx_pid_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(wyx_pid_genpy)
add_dependencies(wyx_pid_genpy wyx_pid_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS wyx_pid_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wyx_pid)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wyx_pid
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(wyx_pid_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wyx_pid)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wyx_pid
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(wyx_pid_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wyx_pid)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wyx_pid
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(wyx_pid_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/wyx_pid)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/wyx_pid
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(wyx_pid_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wyx_pid)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wyx_pid\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wyx_pid
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(wyx_pid_generate_messages_py std_msgs_generate_messages_py)
endif()

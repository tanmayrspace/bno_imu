#!/bin/bash
source /opt/ros/humble/setup.bash

source install/setup.bash 
export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp

export ROS_DOMAIN_ID=21

ros2 run bno055 bno055 --ros-args --params-file src/bno055/params/bno055_params.yaml

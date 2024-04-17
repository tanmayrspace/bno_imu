FROM osrf/ros:humble-desktop-full
RUN apt-get update && apt-get install -y \
  ros-humble-rmw-cyclonedds-cpp\
  ros-humble-ament-cmake\
  python3-pip python3-rosdep
RUN pip3 install smbus serial
RUN rosdep update
RUN rosdep install src/
WORKDIR /bno_imu
ENV ROS_DOMAIN_ID=21
COPY src/bno055/ ./src/
RUN colcon build
COPY entrypoint.sh entrypoint.sh
CMD ["bash"]
ENTRYPOINT [ "/bin/bash" ,"entrypoint.sh"]

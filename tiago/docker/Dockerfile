####################################################################
#Tiago

#http://wiki.ros.org/Robots/TIAGo/Tutorials/Installation/InstallUbuntuAndROS
FROM ros:melodic as tiago-builder
ENV ROS_DISTRO melodic
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
  git \
  python-rosinstall \
  ros-$ROS_DISTRO-desktop-full \
  python-catkin-tools \
  ros-$ROS_DISTRO-joint-state-controller \
  ros-$ROS_DISTRO-twist-mux \
  ros-$ROS_DISTRO-ompl \
  ros-$ROS_DISTRO-controller-manager \
  ros-$ROS_DISTRO-moveit-core \
  ros-$ROS_DISTRO-moveit-ros-perception \
  ros-$ROS_DISTRO-moveit-ros-move-group \
  ros-$ROS_DISTRO-moveit-kinematics \
  ros-$ROS_DISTRO-moveit-ros-planning-interface \
  ros-$ROS_DISTRO-moveit-simple-controller-manager \
  ros-$ROS_DISTRO-moveit-planners-ompl \
  ros-$ROS_DISTRO-joy \
  ros-$ROS_DISTRO-joy-teleop \
  ros-$ROS_DISTRO-teleop-tools \
  ros-$ROS_DISTRO-control-toolbox \
  ros-$ROS_DISTRO-sound-play \
  ros-$ROS_DISTRO-navigation \
  ros-$ROS_DISTRO-depthimage-to-laserscan \
  ros-$ROS_DISTRO-moveit-commander \
  rviz \
  && rm -rf /var/lib/apt/lists/*
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN mkdir -p /root/catkin_ws/src
WORKDIR /root/catkin_ws
RUN echo 'source /opt/ros/$ROS_DISTRO/setup.bash' >> /root/.bashrc
RUN echo 'source /root/catkin_ws/devel/setup.bash' >> /root/.bashrc
COPY docker/tiago_public.rosinstall .
RUN rosinstall src /opt/ros/$ROS_DISTRO tiago_public.rosinstall
ARG ROSDEP_IGNORE="opencv2 opencv2-nonfree pal_laser_filters speed_limit_node sensor_to_cloud hokuyo_node libdw-dev python-graphitesend-pip python-statsd pal_filters pal_vo_server pal_usb_utils pal_pcl pal_pcl_points_throttle_and_filter pal_karto pal_local_joint_control camera_calibration_files pal_startup_msgs pal-orbbec-openni2 dummy_actuators_manager pal_local_planner gravity_compensation_controller current_limit_controller dynamic_footprint dynamixel_cpp tf_lookup opencv3"
RUN apt-get update && rosdep install --from-paths src --ignore-src -y --rosdistro melodic --skip-keys="${ROSDEP_IGNORE}"
RUN bash -c "source /opt/ros/melodic/setup.bash \
    && catkin build -DCATKIN_ENABLE_TESTING=0 \
    && echo 'source /root/catkin_ws/devel/setup.bash' >> ~/.bashrc"

FROM tiago-builder as tiago
#TODO make image smaller

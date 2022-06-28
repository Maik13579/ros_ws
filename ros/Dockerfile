FROM ros:noetic as builder-base
ENV ROS_DISTRO noetic
ENV DEBIAN_FRONTEND noninteractive
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN mkdir -p /root/catkin_ws/src
WORKDIR /root/catkin_ws
RUN echo 'source /opt/ros/$ROS_DISTRO/setup.bash' >> /root/.bashrc
RUN echo 'source /root/catkin_ws/devel/setup.bash' >> /root/.bashrc

FROM ros:noetic-ros-core as base
ENV ROS_DISTRO noetic
ENV DEBIAN_FRONTEND noninteractive
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN mkdir -p /root/catkin_ws/src
WORKDIR /root/catkin_ws
RUN echo 'source /opt/ros/$ROS_DISTRO/setup.bash' >> /root/.bashrc
RUN echo 'source /root/catkin_ws/devel/setup.bash' >> /root/.bashrc

#Base
####################################################################
#Visualization

FROM base as gazebo
RUN apt-get update && apt-get install -y --no-install-recommends \
  ros-$ROS_DISTRO-gazebo-ros-pkgs \
  ros-$ROS_DISTRO-gazebo-ros-control \
  && rm -rf /var/lib/apt/lists/*

FROM base as rviz
RUN apt-get update \
  && apt-get -y install rviz \
  && rm -rf /var/lib/apt/lists/*

FROM base as rqt
RUN apt-get update && apt-get install -y --no-install-recommends \
  ros-$ROS_DISTRO-rqt \
  ros-$ROS_DISTRO-rqt-common-plugins \
  ros-$ROS_DISTRO-rqt-robot-plugins \
  && rm -rf /var/lib/apt/lists/*

#Visualization
####################################################################
#Containers

FROM base as map_server
RUN apt-get update && apt-get install -y --no-install-recommends \
  ros-$ROS_DISTRO-map-server \
  && rm -rf /var/lib/apt/lists/*

FROM base as gmapping
RUN apt-get update && apt-get install -y --no-install-recommends \
  ros-$ROS_DISTRO-slam-gmapping \
  && rm -rf /var/lib/apt/lists/*

FROM base as amcl
RUN apt-get update && apt-get install -y --no-install-recommends \
  ros-$ROS_DISTRO-amcl \
  && rm -rf /var/lib/apt/lists/*

FROM base as octomap
RUN apt-get update && apt-get install -y --no-install-recommends \
  ros-$ROS_DISTRO-octomap \
  ros-$ROS_DISTRO-octomap-mapping \
  && rm -rf /var/lib/apt/lists/*


#Containers
#####################################################################

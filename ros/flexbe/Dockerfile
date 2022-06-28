#FLEXBE

FROM ros:noetic as flexbe
ENV ROS_DISTRO noetic
MAINTAINER Maik Knof
ENV DEBIAN_FRONTEND noninteractive
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN mkdir -p /root/catkin_ws/src
WORKDIR /root/catkin_ws/src
RUN apt-get update && apt-get install -y --no-install-recommends\
 git\
 curl\
 python3-dev\
 python3-pip\
 python3-venv
RUN git clone https://github.com/team-vigir/flexbe_behavior_engine.git\
 && git clone https://github.com/FlexBE/flexbe_app.git
COPY flexbe .
WORKDIR /root/catkin_ws
RUN source /opt/ros/$ROS_DISTRO/setup.bash && catkin_make
RUN apt-get update && rosdep install --from-paths src --ignore-src -y --rosdistro $ROS_DISTRO
RUN apt update && apt install -y --no-install-recommends\
 libgconf-2-4\
 libatk1.0-0\
 libatk-bridge2.0-0\
 libgdk-pixbuf2.0-0\
 libgtk-3-0\
 libgbm-dev\
 libnss3-dev\
 libxss-dev\
 libx11-xcb1\
 libx11-xcb-dev\
 libxtst6\
 libasound2\
 libgl1\
 libcanberra-gtk-module\
 libcanberra-gtk3-module

RUN echo 'source /opt/ros/$ROS_DISTRO/setup.bash' >> /root/.bashrc
RUN echo 'source /root/catkin_ws/devel/setup.bash' >> /root/.bashrc


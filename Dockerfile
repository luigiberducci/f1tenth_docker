# Author:		Luigi Berducci
# Purpose:		F1TENTH class
#
# To build:		docker build -t f1tenth .
# To run: 		docker run -it --rm -p 6080:80  f1tenth
#
# 0.0 - Base image: ubuntu 20.04 focal
FROM dorowu/ubuntu-desktop-lxde-vnc:focal
# 0.1 - Install useful tools
RUN apt-get update && apt-get install -q -y \
	    tmux \
	    zsh \
	    curl \
	    wget \
	    libgl1-mesa-glx \
	    unzip \
            dirmngr \
            gnupg2 \
            lsb-release \
	    && rm -rf /var/likb/apt/lists/*

# 1.1 - Setup sources.list
RUN echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list
# 1.2 - Setup keys
RUN apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
# 1.3 - Installation of ROS Noetic
RUN apt-get update && apt-get install -y ros-noetic-desktop
# NOT NEEDED FOR NOW
# 1.4 - Installation of dependencies for building packages
#RUN apt-get update && apt-get install --no-install-recommends -y \
#    python3-rosdep \
#    python3-rosinstall \
#    python3-rosinstall-generator \
#    python3-wstool \
#    build-essential 
#    && rm -rf /var/lib/apt/lists/*

# 2.1 - Install simulator's dependencies
RUN apt-get install -y  ros-noetic-tf2-geometry-msgs \
			ros-noetic-ackermann-msgs \
			ros-noetic-joy \ 
			ros-noetic-map-server \
			git \
			g++
# 2.2 - Install the simulator by cloning the repo in the catkin workspace
RUN mkdir -p /home/catkin_ws/src
WORKDIR /home/catkin_ws/src
RUN git clone https://github.com/CPS-TUWien/f1tenth_simulator.git
# 2.3 - Build the simulator
RUN /bin/bash -c '. /opt/ros/noetic/setup.bash; cd /home/catkin_ws/src; catkin_init_workspace'
RUN /bin/bash -c '. /opt/ros/noetic/setup.bash; cd /home/catkin_ws; catkin_make'
# 2.4 - Automatically source the ROS workspace
WORKDIR /root
RUN echo 'source /opt/ros/noetic/setup.sh' >> .bashrc
RUN echo 'source /home/catkin_ws/devel/setup.sh' >> .bashrc

# 3.1 - Port configuration for VNC interfact
EXPOSE 80
#WORKDIR /home/
#ENV HOME=/home/ubuntu \
#    SHELL=/bin/bash
#ENTRYPOINT ["/startup.sh"]

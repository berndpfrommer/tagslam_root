# TagSLAM root repository

Use this repository to get a complete ROS/catkin workspace with all
dependencies for the [TagSLAM project](https://berndpfrommer.github.io/tagslam/).

This repository relies heavily on [git submodules](https:www.vogella.com/tutorials/GitSubmodules/article.html).

## Installation instructions

Since this is ROS package, you will need
to [install ROS](http://wiki.ros.org/Installation/Ubuntu). This repo
has been tested on Ubuntu 16.04 (ROS Kinetic) and Ubuntu 18.04 (ROS
Melodic). On top of it, install the catkin tools:

    sudo apt install python-catkin-tools

TagSLAM's backend is based on GTSAM:

    sudo apt-add-repository ppa:bernd-pfrommer/gtsam
    sudo apt update
    sudo apt install gtsam

Make a new catkin workspace, clone the root repository and
simultaneously update the submodules:

    mkdir ~/catkin_ws
	cd ~/catkin_ws
    git clone --recursive https://github.com/berndpfrommer/tagslam_root.git

Configure and compile:

    catkin config -DCMAKE_BUILD_TYPE=Release
    catkin build


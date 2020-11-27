# TagSLAM root repository

Use this repository to get a complete ROS/catkin workspace with all
dependencies for the [TagSLAM project](https://berndpfrommer.github.io/tagslam_web).

This repository relies heavily on [git submodules](https:www.vogella.com/tutorials/GitSubmodules/article.html).

## Installation instructions

Since this is ROS package, you will need
to [install ROS](http://wiki.ros.org/Installation/Ubuntu). This repo
has been tested on Ubuntu 16.04 (ROS Kinetic) and Ubuntu 18.04 (ROS
Melodic). On top of it, install the catkin tools:

    sudo apt install python-catkin-tools

TagSLAM's backend is based on GTSAM, so you will need to add a PPA.

If you previously installed GTSAM, you need to first remove the older version:

    sudo apt remove gtsam
    sudo add-apt-repository --remove ppa:bernd-pfrommer/gtsam

Now add the official borglab ppa and install GTSAM:

    sudo apt-add-repository ppa:borglab/gtsam-release-4.0
    sudo apt update
    sudo apt install libgtsam-dev libgtsam-unstable-dev

Clone the full repo including all submodules, into a a new catkin
workspace (``tagslam_root``):

	cd ~
    git clone --recursive https://github.com/berndpfrommer/tagslam_root.git

Configure and compile:

    cd ~/tagslam_root
    catkin config -DCMAKE_BUILD_TYPE=Release
    catkin build

## Quick test

Overlay the newly created workspace and run a quick test:

    source ~/tagslam_root/devel/setup.bash
    roslaunch tagslam tagslam.launch bag:=`rospack find tagslam`/example/example.bag

(the rosnode will not exit, so you have to Ctrl-C out of it)

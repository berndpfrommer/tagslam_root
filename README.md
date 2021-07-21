# TagSLAM root repository

Use this repository to get a complete ROS/catkin workspace with all
dependencies for the [TagSLAM project](https://berndpfrommer.github.io/tagslam_web).

This repository relies heavily on [git submodules](https:www.vogella.com/tutorials/GitSubmodules/article.html).

## Installation instructions

Since this is ROS package, you will need
to [install ROS](http://wiki.ros.org/Installation/Ubuntu). This repo
has been tested on Ubuntu 16.04 (ROS Kinetic), Ubuntu 18.04 (ROS
Melodic) and Ubuntu 20.04 (ROS Noetic). In addition to ROS install the
catkin tools (U16.04 and U18.04):

    sudo apt install python-catkin-tools # Ubuntu 16.04 and 18.04
    sudo apt install python3-catkin-tools python3-osrf-pycommon # Ubuntu 20.04

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

### For Ubuntu 18.04 and later:
Configure and compile:

    cd ~/tagslam_root
    catkin config -DCMAKE_BUILD_TYPE=Release
    catkin build

## For Ubuntu 16.04:
Ubuntu 16.04 lacks support for C++ standard 17, so you need to install
a later version of cmake and g++-7 from PPA repositories:

    sudo add-apt-repository ppa:ubuntu-toolchain-r/test
    sudo apt-get update
    sudo apt-get install gcc-7 g++-7

Then [upgrade cmake](https://askubuntu.com/questions/952429/is-there-a-good-ppa-for-cmake-backports):

    sudo apt-add-repository 'deb https://apt.kitware.com/ubuntu/ xenial main'
    sudp apt-get update
    sudo apt-get install kitware-archive-keyring
    sudo apt-key --keyring /etc/apt/trusted.gpg del C1F34CDD40CD72DA
    sudo apt-get update
    sudo apt-get install cmake

Direct cmake to use the g++-7 compiler:

    cd ~/tagslam_root
    catkin config -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_COMPILER=g++-7
    catkin build

You will get tons of warning messages, but it should compile.

## Quick test

Overlay the newly created workspace and run a quick test:

    source ~/tagslam_root/devel/setup.bash
    roslaunch tagslam tagslam.launch bag:=`rospack find tagslam`/example/example.bag

(the rosnode will not exit, so you have to Ctrl-C out of it)

## License

This software and any future contributions to it are licensed under
the [Apache License 2.0](LICENSE).

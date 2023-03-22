# TagSLAM root repository

Use this repository to get a complete ROS/catkin workspace with all
dependencies for the [TagSLAM project](https://berndpfrommer.github.io/tagslam_web).

## Installation instructions

Since this is ROS package, you will need
to [install ROS](http://wiki.ros.org/Installation/Ubuntu). This repo
has been tested on Ubuntu 20.04 (ROS noetic). In the past it has also
worked on Ubuntu 18.04 (ROS melodic).
In addition to ROS you need to install the following tools:
```
sudo apt install python3-vcstool
sudo apt install python-catkin-tools # Ubuntu 16.04 and 18.04
sudo apt install python3-catkin-tools python3-osrf-pycommon # Ubuntu >20.04
```

TagSLAM's backend is based on GTSAM, so you will need to add a PPA.

If you previously installed GTSAM, you need to first remove the older version:
```
sudo apt remove gtsam
sudo add-apt-repository --remove ppa:bernd-pfrommer/gtsam
sudo apt-add-repository --remove ppa:borglab/gtsam-release-4.0
```
	
Now add the official borglab ppa and install GTSAM:
```
sudo apt-add-repository ppa:borglab/gtsam-release-4.1
sudo apt update
sudo apt install libgtsam-dev libgtsam-unstable-dev
```

Clone the full repo including all submodules, into a a new catkin
workspace (``tagslam_root``):
```
cd ~
git clone https://github.com/berndpfrommer/tagslam_root.git
cd ~/tagslam_root
vcs import --recursive < tagslam_root.repos
```

Configure and compile:
```
catkin config -DCMAKE_BUILD_TYPE=RelWithDebInfo
catkin build
```

## Using custom GTSAM

To use a custom version of GTSAM that is installed under the prefix e.g.
``/home/foo/usr/``, modify the cmake prefix path before building:
```
export CMAKE_PREFIX_PATH=${CMAKE_PREFIX_PATH}:/home/foo/usr
```

## Quick test

Overlay the newly created workspace and run a quick test:

    source ~/tagslam_root/devel/setup.bash
    roslaunch tagslam tagslam.launch bag:=`rospack find tagslam`/example/example.bag

(the rosnode will not exit, so you have to Ctrl-C out of it)

## License

This software and any future contributions to it are licensed under
the [Apache License 2.0](LICENSE).

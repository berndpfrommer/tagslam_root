#!/bin/bash
# set up ROS
distros=('melodic' 'noetic')
pkg=$1
#
# probe for the ROS1 distro
#
for distro in "${distros[@]}"
do
    echo "probing for ${distro}"
    if [[ -f "/opt/ros/${distro}/setup.bash" ]]; then
	source /opt/ros/${distro}/setup.bash
	echo "found distro: ${distro}"
	break
    fi
done

# run vcs tool to bring in the additional repositories required
cd ${pkg}
vcs import --recursive < ${pkg}.repos

# build
catkin config -DCMAKE_BUILD_TYPE=RelWithDebInfo
catkin build


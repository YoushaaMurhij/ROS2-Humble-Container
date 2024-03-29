#!/usr/bin/env bash
set -eu

# This install script is released under the Apache-2.0.
# REF: https://index.ros.org/doc/ros2/Installation/Linux-Install-Debians/
# by Open Robotics, licensed under CC-BY-4.0
# source: https://github.com/ros2/ros2_documentation

CHOOSE_ROS_DISTRO=humble
INSTALL_PACKAGE=desktop

sudo apt-get update
export DEBIAN_FRONTEND=noninteractive
DEBIAN_FRONTEND=noninteractive sudo -E apt-get install -y keyboard-configuration
sudo apt-get install -y curl gnupg2 lsb-release
curl -Ls https://raw.githubusercontent.com/ros/rosdistro/master/ros.key | sudo apt-key add -
sudo sh -c 'echo "deb http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" > /etc/apt/sources.list.d/ros2-latest.list'
sudo apt-get update
sudo apt-get install -y ros-${CHOOSE_ROS_DISTRO}-${INSTALL_PACKAGE}
sudo apt-get install -y python3-argcomplete
sudo apt-get install -y python3-colcon-common-extensions
sudo apt-get install -y python3-rosdep python3-vcstool # https://index.ros.org/doc/ros2/Installation/Linux-Development-Setup/
sudo rosdep init
rosdep update
sudo apt-get install -y ros-${CHOOSE_ROS_DISTRO}-gazebo-ros-pkgs
grep -F "source /opt/ros/${CHOOSE_ROS_DISTRO}/setup.bash" ~/.bashrc ||
echo "source /opt/ros/${CHOOSE_ROS_DISTRO}/setup.bash" >> ~/.bashrc

set +u

source /opt/ros/${CHOOSE_ROS_DISTRO}/setup.bash

echo "success installing ROS2 ${CHOOSE_ROS_DISTRO}"
echo "Run 'source /opt/ros/${CHOOSE_ROS_DISTRO}/setup.bash'"
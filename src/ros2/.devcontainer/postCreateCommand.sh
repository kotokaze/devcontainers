#!/usr/bin/env bash
set -e

### Setup ROS2 workspace
vcs import src < ros2.repos
colcon build --symlink-install

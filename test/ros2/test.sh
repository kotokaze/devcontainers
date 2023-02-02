#!/bin/bash
cd $(dirname "$0")
source test-utils.sh

# Template specific tests
check "distro" lsb_release -c
check "ros2" source /opt/ros/*/setup.bash && ros2 doctor
check "webserver" service nginx status

# Report result
reportResults

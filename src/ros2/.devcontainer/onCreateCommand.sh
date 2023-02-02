#!/usr/bin/env bash
set -e

WS_DIR=${1}
ROS_DISTRO=${2:-"foxy"}

# Git config
git config --global devcontainers-theme.show-dirty 1
git config --global --add safe.directory ${WS_DIR}

# Add source command to zshrc
cat << EOF >> /home/${USER}/.zshrc

# Source ROS2
test -f /opt/ros/${ROS_DISTRO}/setup.zsh && source $_
test -f /usr/share/colcon_cd/function/colcon_cd.sh && source $_
test -f /usr/share/colcon_argcomplete/hook/colcon-argcomplete.zsh && source $_
test -f ${WS_DIR}/install/setup.zsh && source $_

EOF

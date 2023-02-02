FROM tiryoh/ros2-desktop-vnc:${templateOption:distro}

# [Optional] Uncomment to use mirror for apt
RUN sed -i 's\http://archive.ubuntu.com/ubuntu/\mirror://mirrors.ubuntu.com/mirrors.txt\' /etc/apt/sources.list;

# [OPtional] Install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#   && apt-get -y install --no-install-recommends <your-package-list-here>

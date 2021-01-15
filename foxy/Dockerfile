FROM nvidia/cuda:11.1-cudnn8-devel-ubuntu20.04
LABEL maintainer="yosha.morheg@gmail.com>"

ENV DEBIAN_FRONTEND=noninteractive
RUN echo "Set disable_coredump false" >> /etc/sudo.conf
RUN apt-get update -q && \
    apt-get upgrade -yq && \
    apt-get install -yq wget curl git build-essential vim sudo lsb-release locales bash-completion tzdata gosu && \
    rm -rf /var/lib/apt/lists/*
RUN useradd --create-home --home-dir /home/ros2 --shell /bin/bash --user-group --groups adm,sudo ros2 && \
    echo ros2:ros2 | chpasswd && \
    echo "ros2 ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
COPY ./ros-foxy-desktop.sh /ros-foxy-desktop.sh
RUN mkdir -p /tmp/ros_setup_scripts_ros2 && mv /ros-foxy-desktop.sh /tmp/ros_setup_scripts_ros2/ && \
    gosu ros2 /tmp/ros_setup_scripts_ros2/ros-foxy-desktop.sh && \
    rm -rf /var/lib/apt/lists/*
ENV USER ros2
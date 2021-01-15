#!/bin/bash

cd "$(dirname "$0")"

workspace_dir=$PWD

if [ "$(docker ps -aq -f status=exited -f name=ros2)" ]; then
    docker rm ros2;
fi

docker run -it -d --rm \
    --gpus all \
    --env="DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --privileged \
    --name ros2 \
    --net "host" \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    -v $workspace_dir/:/home/ros2/catkin_ws:rw \
    x64foxy/ros2:latest

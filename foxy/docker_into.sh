#!/bin/bash
docker exec -it --user "ros2" ros2 \
    /bin/bash -c "source /opt/ros/foxy/setup.bash;
    /bin/bash"

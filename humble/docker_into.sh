#!/bin/bash
docker exec -it --user "ros2" ros2 \
    /bin/bash -c "source /opt/ros/humble/setup.bash;
    /bin/bash"

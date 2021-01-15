#!/bin/bash
docker build . \
             -f foxy/Dockerfile \
             -t x64foxy/ros2:latest 

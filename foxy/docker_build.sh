#!/bin/bash
docker build . \
             -f foxy/Dockerfile \
             -t x64ros2/foxy:latest 

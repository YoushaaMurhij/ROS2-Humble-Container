#!/bin/bash
docker build . \
             -f humble/Dockerfile \
             -t x64ros2/humble:latest 

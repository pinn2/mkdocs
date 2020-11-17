#! /bin/bash

docker run --rm -v /Users/pintu.sharma/Desktop/mkdocs_project/:/root/mkdocs_project pints_test:latest produce /root/mkdocs_project > mkdocs_project.tar.gz

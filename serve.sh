#! /bin/bash

cat mkdocs_project.tar.gz | docker run --rm -p 8000:8000 -i pints_test:latest serve
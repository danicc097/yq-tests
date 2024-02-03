#!/bin/bash
# go install github.com/mikefarah/yq/v4@v4.34.2
find . | entr bash -c 'clear; ./merge.sh; cat output.yaml'

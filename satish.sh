#!/bin/bash
IMAGE="snaidu/$IMAGE_ID"
echo "$IMAGE_ID"
sed -r 's/^(\s*)(image\s*:\s*{snaidu/rideeasy:**}\s*$)/\1image: $IMAGE/' deployment.yml
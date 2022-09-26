# pwn_config

## Build a container from Dockerfile 

docker build -t ctf - < ./Dockerfile

## Confirm the image is installed

docker image ls

# Run an image with some specific parameters (that would allow debugging):

docker run --rm -v somepath_to_share_with_docker:/pwd --cap-add=SYS_PTRACE --security-opt seccomp=unconfined --platform linux/amd64 -d --name ctf -i ctf

docker run -d -p 1024:1024 -it --platform linux/arm arm32v7/ubuntu

# To join a container:

docker exec -it ctf /bin/bash


docker run --rm -it --privileged \
    -e DISPLAY=$DISPLAY \
    -e MYUID=$(id -u) \
    -e MYGID=$(id -g) \
    -e MYUSERNAME=$(id -un) \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v /var/run/docker.sock:/var/run/docker.sock \
    --name vsc vscode bash

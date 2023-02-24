# jupyterlab
jupyter/docker-stacks small modification for own use

# TL;DR
```bash
# Start machine learning setup

$ VOLUME_NAME=jupyterlab
$ docker volume create $VOLUME_NAME
$ docker run -p 8888:8888 -v $VOLUME_NAME:/home/jovyan/ -d --name=jupyterlab fantast03/jupyterlab-machine-learning:latest
```

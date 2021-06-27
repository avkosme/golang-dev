# Golang nvim development environment

## Quick start

Create local volumes, run container in current directory:

```
$ docker volume create --driver local --name nvimdotfiles

$ docker volume create --driver local --name gobin

$ echo 'alias golang-dev="docker run -ti --rm -v nvimdotfiles:/root \
-v gobin:/go/bin -v `pwd`:/opt --workdir='/opt' avkosme/golang-dev:latest sh"' >> ~/.bashrc

$ source ~/.bashrc

$ golang-dev
```

![](img/demo.gif)

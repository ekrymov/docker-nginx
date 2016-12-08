# Nginx Dockerfile (docker-nginx)

A nice and easy way to get a Nginx server up and running using docker. For
help on getting started with docker see the [official getting started guide][0].


## Base Docker Image

Base system is the latest LTS version of Ubuntu.


## Build container (optional)

Running this will build you a docker image with the latest version of both
docker-nginx and Nginx itself.

    docker build https://github.com/ekrymov/docker-nginx.git
    
or

    git clone https://github.com/ekrymov/docker-nginx.git
    cd docker-nginx
    docker build -t ekrymov/docker-nginx .


## Create container

Running the first time will set your port to a static port of your choice so
that you can easily map a proxy to. If this is the only thing running on your
system you can map the ports to 80, 443 and no proxy is needed. i.e.
`-p=80:80  -p=443:443` Also be sure your mounted
directory on your host machine is already created before running.

    sudo docker run --name nginx -d -p=80:80 -p=443:443
    -v=<sites-enabled-dir>:/etc/nginx/sites-enabled -v=<sites-dir>:/var/www/html
    -v=<log-dir>:/var/log/nginx ekrymov/docker-nginx

From now on when you start/stop docker-nginx you should use the container id
with the following commands. To get your container id, after you initial run
type `sudo docker ps` and it will show up on the left side followed by the image
name which is `ekrymov/docker-nginx`.

    sudo docker start <container_id>
    sudo docker stop <container_id>


### Notes on the run command

 + `--name` is the container name (`nginx`)
 + `-v` is the volume you are mounting `-v=host_dir:docker_dir`
 + `ekrymov/docker-nginx` is simply what I called my docker build of this image
 + `-d` allows this to run cleanly as a daemon, remove for debugging
 + `-p` is the port it connects to, `-p=host_port:docker_port`

[0]: http://www.docker.io/gettingstarted/

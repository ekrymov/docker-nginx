#################################################################
# Ubuntu 16.04 with added Ngins HTTP Server.
#
# Builds a basic docker image that can run Nginx
#
# Authors: Eugene Krymov
# Updated: Dec 08th, 2016
# Require: Docker (http://www.docker.io/)
#################################################################

# Base system is the LTS version of Ubuntu
FROM ubuntu:16.04

# Make sure we don't get notifications we can't answer during building
ENV DEBIAN_FRONTEND noninteractive

# Update system and install nginx
RUN apt-get update; apt-get upgrade -y
RUN apt-get install -y nginx
RUN apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf
RUN chown -R www-data:www-data /var/lib/nginx

# Expose the Standart HTTP port.
EXPOSE 80
# Expose the Standart HTTPS port.
EXPOSE 443

# Define mountable directories 
VOLUME ["/etc/nginx/sites-enabled", "/var/www/html", "/var/log/nginx"]

# Define working directory
WORKDIR /etc/nginx

# Start Nginx Server
CMD ["nginx"]

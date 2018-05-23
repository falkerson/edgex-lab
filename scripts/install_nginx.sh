#! /bin/bash

# pull nginx image (required ???)
sudo docker pull nginx
# run nginx and bind internal port
sudo docker run --name docker-nginx -p 80:80 -d nginx


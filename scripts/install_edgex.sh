# login into nexus repository
sudo docker login nexus3.edgexfoundry.org:10004 -p docker -u docker
# run compose
sudo docker-compose -f /etc/docker-compose.yaml up -d


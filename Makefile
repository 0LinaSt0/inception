sudo service docker restart #restart docker

sudo docker-compose up -d # create docker_compose from all images and detach flag for running it background
sudo docker-compose up -d --no-deps --build <service_name> #rebuild one image in docker-compose
#--no-deps - Don't start linked services.
#--build - Build images before starting containers.

sudo docker ps -a # show all images

docker rm -vf $(docker ps -aq) # to delete all containers including its volumes
docker rmi -f $(docker images -aq) # to delete all the images
docker system prune -a --volumes # to remov e all unused containers, volumes, networks and images

docker run --rm -it --entrypoint bash <ip-image> # create and run container with runing bash inside it and deleting it after work


STEPS:
2. MAKEFILE
3. ENV
4. VOLUMES
5. ADD PLUS ONE USER TO MARIADB
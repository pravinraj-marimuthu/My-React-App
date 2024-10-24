#!/bin/sh	
timestamp_tag=$(date +%Y%m%d%H%M%S)
sudo echo $timestamp_tag > /opt/devops-build/build/versions.txt
echo ""
echo "Building the latest Docker Image..."
echo ""
docker-compose -f /opt/devops-build/build/compose.yaml down
echo ""
docker-compose -f /opt/devops-build/build/compose.yaml build
echo ""
docker tag build-frontend pravinrajmarimuthu/my-react-app-dev:$(cat /opt/devops-build/build/versions.txt)
echo ""
echo "Pushing the image to Docker Hub..."
echo ""
docker login --username pravinrajmarimuthu --password Iampravin7010
echo ""
docker push pravinrajmarimuthu/my-react-app-dev:$(cat /opt/devops-build/build/versions.txt)
echo ""
echo "The latest Docker image version is $(cat /opt/devops-build/build/versions.txt)"
echo ""
echo "The docker image has been successfully built and pushed...!"

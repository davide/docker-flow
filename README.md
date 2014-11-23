docker-flow
===========

Facebook's flow (a Static Type Checker for JavaScript) packaged in Docker


Instructions
------------

Don't fork this project since it just contains the Dockerfile to create the docker image.

Instead use the existing image mapping your code folder as the /app volume.
When you launch the container it will run flow on that folder.

`
sudo docker run -i -t -v APP_FOLDER_PATH:/app nesrait/docker-flow
`

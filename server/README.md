# Server

This is the server for the Chat-All Application


## Build
### Using Visual Studio Code
npm install -g gulp-cli
npm install
gulp build

### Using Docker
docker build -t <your-Dockerhub-account>/chatserverapp .


## Run
### Using Visual Studio Code
npm start

### Using Docker
winpty docker run --name chatserverapp --rm -it -p 4965:8080 <your-Dockerhub-account>/chatserverapp

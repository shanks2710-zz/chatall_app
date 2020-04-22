# Client

This is the client for the Chat-All Application


## Build
### Using Visual Studio Code
npm install

### Using Docker
docker build -t <your-Dockerhub-account>/chatclientapp .


## Run
### Using Visual Studio Code
ng serve
Navigate to URL: [http://localhost:4200](http://localhost:4200/)
### Using Docker
winpty docker run --name chatclientapp --rm -it -p 90:80 <your-Dockerhub-account>/chatclientapp
navigate to URL: [http://<your-docker-machine-ip>:4200](http://<your-docker-machine-ip>:4200/)
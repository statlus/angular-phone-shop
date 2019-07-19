# Docker 101

This repository holds the code and Docker components for a simple Angular Store App, made using this tutorial: https://angular.io/start.

## Running Locally

To run the app locally, you need the following installed:
* node ~10.16.0

To install all other dependencies just run:
```bash
npm install
```
Afterwards, just run the below to run the app locally:
```bash
ng serve -o
```
## Running In Docker

In this repository, there are two Dockerfiles:

### Dockerfile
This is a standard Dockerfile with that runs ng serve to run the app.

To build an image with it:
```bash
docker build -t docker101:dev .
```

To run the image:
```bash
docker run -p 4201:4200 --rm docker101:dev
```

See the app running:
```bash
http://localhost:4200
```

### Dockerfile.multistage
This is a multi-stage Dockerfile that does the following:
1. Build the application with ng build --prod
2. Copy the dist directory from the build stage and copy it into the web server directory in Nginx

To build an image with it:
```bash
docker build -f Dockerfile.multistage -t docker101:prod .
```

To run the image:
```bash
docker run -p 8080:80 --rm docker101:prod
```

See the app running:
```bash
http://localhost:8080
```

### docker-compose.yml
Instead of using the above Docker commands to build and run the images, you can use Docker Compose to do all of that with one command!

Just make sure you have the following installed:
* Docker
* Docker Compose

To use docker-compose.yml:
```bash
docker-compose up
```

Once everything is running you should be able to access both containers in your browser:
```bash
http://localhost:4201
http://localhost:8080
```
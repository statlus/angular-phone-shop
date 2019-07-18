# base image
FROM node:10.16.0

# set working directory
WORKDIR /code

# install and cache app dependencies
COPY package.json /code/package.json
RUN npm install
RUN npm install -g @angular/cli@7.0.7

# add app
COPY . /code

# start app
CMD ng serve --host 0.0.0.0
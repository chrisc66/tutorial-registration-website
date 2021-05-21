FROM node:16.2.0-buster

# Global Angular environment and dependency
RUN npm install -g @angular/cli@12.0.1

# Setting up premission
RUN mkdir -p /usr/app
RUN adduser --disabled-password --gecos '' angular \ 
  && chown -R angular /usr/app
USER angular

# Downloading application
WORKDIR /usr/app
RUN wget https://github.com/chrisc66/angular-11-crud-app/archive/refs/heads/master.zip \
  && unzip master.zip \
  && rm -f master.zip

# Local Angular environment and dependency
WORKDIR /usr/app/angular-11-crud-app-master/
RUN npm install --save-dev @angular-devkit/build-angular
RUN ng update

# Starting application
ENTRYPOINT [ "ng", "serve", "--port", "8081" ]

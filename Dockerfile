FROM jenkins/jenkins:2.435-jdk17
USER root
WORKDIR /myapp
RUN mkdir /myapp/newman
COPY package*.json ./
RUN apt-get update && apt-get install -y curl lsb-release
RUN apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs
RUN apt-get update --fix-missing && \
    apt-get upgrade -y --fix-missing && \
    apt-get install -y npm
RUN node -v
RUN npm -v
RUN npm install -g newman newman-reporter-htmlextra
USER jenkins
RUN jenkins-plugin-cli --plugins "blueocean:1.27.9 docker-workflow:572.v950f58993843 credentials:1309.v8835d63eb_d8a_ workflow-aggregator:596.v8c21c963d92d"
RUN jenkins-plugin-cli --plugins "git:5.2.1 github:1.37.3.1 htmlpublisher:1.32"
RUN jenkins-plugin-cli --plugins "docker-plugin:1.5 docker-compose-build-step:1.0" 
COPY postman_collections/trello-rest-api-testing.json postman_collections/trello-rest-api-testing.json
COPY postman_collections/trello-rest-api-testing.json /newman/trello-rest-api-testing.json

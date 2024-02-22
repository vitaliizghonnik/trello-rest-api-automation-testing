FROM jenkins/jenkins:2.444-jdk17
USER root
WORKDIR /myapp
COPY package*.json ./
RUN apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs
RUN apt-get update && apt-get install -y npm
RUN node -v
RUN npm -v
RUN npm install -g newman newman-reporter-htmlextra
USER jenkins
RUN jenkins-plugin-cli --plugins "blueocean:1.27.10 docker-workflow:572.v950f58993843 credentials:1319.v7eb_51b_3a_c97b_ workflow-aggregator:596.v8c21c963d92d"
RUN jenkins-plugin-cli --plugins "git:5.2.1 github:1.37.3.1 htmlpublisher:1.32"
RUN jenkins-plugin-cli --plugins "docker-plugin:1.6 docker-compose-build-step:1.0" 

# Trello-REST-API-Testing
This repository contains a collection of requests created in Postman designed to test the primary functionalities of the Trello management tool. The testing process is automated using the Newman CLI to run the collection. This is facilitated through a Freestyle project in Jenkins CI/CD, which is containerized using Docker.

# Introduction
Trello is a web-based, list-making application and famous project management tool used to manage projects, organize tasks, and build team collaboration. The major idea of creating this collection trello-rest-api-testing in Postman is to test the main functionality that the Trello application allows us to do such as create/get/delete boards, create/get lists, create/get/update/move cards, add new member/comment to a card, create a checklist on a card.

**Each request is tested with regards to testing status code, response body, headers, and cookies.**

This collection includes two folders: ***happy path testing and negative testing***. **Happy path testing** is executed to verify that the Trello application is working according to the specified requirements by providing valid test data provided by the Trello developer team with the Trello REST API documentation. On the other hand **negative testing** folder consists of requests that ensure that the Trello application can gracefully handle invalid input or unexpected user behavior.

# Getting started
Before sending requests to the Trello REST API check out and familiarize yourself with the [API Introduction](https://developer.atlassian.com/cloud/trello/guides/rest-api/api-introduction/) first to understand better what are the possibilities that Trello allows us to build.
1. Create a Trello Power-Up
Trello uses a delegated _authentication and authorization flow_, which means no usernames and passwords are used there. Instead of it, to get started is needed to generate an API key. To do it you first need to have created **Trello Power-Up**. In this case, check out [Managing Power-Up documentation](https://developer.atlassian.com/cloud/trello/guides/power-ups/managing-power-ups/#adding-a-new-custom-power-up).

2. Generate a new API key
Once you already have created a Power-Up you can generate a new **API key** that will be at the left sidebar menu of the page.

3. Generate a Token access
On the same page where you found an API key at the right of it, you can see the hyperlinked **Token** also known as a Secret. Follow the instruction of [Authentication and Authorization section](https://developer.atlassian.com/cloud/trello/guides/rest-api/api-introduction/#authentication-and-authorization).
> [!CAUTION]
> > Token should be kept secret

# Collection of requests
# Happy path
1. Create a new board
2. Get our member's data
3. Get Boards that Members behind to
4. Get all lists on the board
5. Create a new list Delay
6. Create a new card in To Do list
7. Get all cards on the To Do list
8. Update contents of the card
9. Add a member to the card
10. Get the member of the card
11. Create a checklist in the card
12. Move all cards from To Do list to Doing list
13. Get all cards on the Doing list
14. Add a new comment to the card
15. Delete the board

# Negative testing
1. Getting deleted board

## Missing authentication
### Missing token
1. Create a new board

### Invalid token
1. Create a new board

## Duplication of activities
1. Adding the already added member to the card
2. Moving cards that have been already moved all cards from To Do list to Doing
3. Removing deleted board

# Testing techniques used in collection
Testing techniques that have been used to verify the compliance of requirements in Trello REST API include the software testing methodologies known as 'Data-Driven Testing' and 'Three-Value Boundary Value Analysis.' These are black-box testing techniques employed in the request called 'Create a checklist' within the current collection's card.

# Installation of Newman command-line collection runner's for Postman (if you are needed to run Postman collection in CLI)
To execute this part, you need to have Node.js installed. You can download it from the official Node.js website. Choose the version to download (the LTS version is recommended for most users). After installation, the NPM package manager most likely will also be installed.
The comprehensive information you can find [here](https://www.npmjs.com/package/newman) and [here](https://github.com/postmanlabs/newman)

The next step is to install the Newman Postman collection runner via NPM, which is quite straightforward. To install Newman globally, run the following script:
```
bash $ npm install -g newman
```
or locally, just by removing `-g` flag

# Automation testing using Jenkins CI/CD as a Docker container
I've created a [Dockerfile](Dockerfile) where I've customized, in my opinion, all the necessary instructions to create and manage isolated, reproducible environments for testing with dependences that stand out among others, such as: Node.js, npm package manager, HTML reporter, BlueOcean and Docker's plagins. So that, it supplies a seamless process of testing and providing some better analyze information about it.

I've chosen [jenkins/jenkins](https://hub.docker.com/r/jenkins/jenkins) an official image from DockerHub as a base image, that contains a fully functional Jenkins server. Automating the build, test, and deployment processes triggered by code changes in the version control repository. It also allows adding own plugins and configuration on top of it.

> [!IMPORTANT]
> In order to make the process successful and ensure that it is up and running today with any possible changes, I strongly suggest using official resources in addition to what is attached here.
>
> The following instruction is designed for implementing it on Windows OS.
>
> For more information visit [Jenkins.io resource](https://www.jenkins.io/doc/book/installing/docker/) for instalation Docker. 
1. Open up a command prompt window.
1. Create a bridge network in Docker:
```
docker network create jenkins
```
Where, ```jenkins``` is a name of the network

3. To create a personalized image in Docker, use the command:
```
docker build –t your_image_name:0.1 .
```
Where, `your_image_name` is the name of a custom image and `0.1` is a version of the image

4. Finally, to run Docker container from image that has been created run the following command in CLI:
```
docker run --name your_container_name --restart=on-failure --detach --network jenkins --env DOCKER_HOST=tcp://docker:2376 --env DOCKER_CERT_PATH=/certs/client --env DOCKER_TLS_VERIFY=1 --volume jenkins-data:/var/jenkins_home --volume jenkins-docker-certs:/certs/client:ro --publish 8081:8080 --publish 50001:50000 -e TrelloKey=your_trello_key -e TrelloToken=your_trello_token your_image_name
```
Make sure to replace ```your_container_name```, ```your_trello_key```, ```your_trello_token```, ```your_image_name``` with your data.

For more information visit [Jenkins.io resource](https://www.jenkins.io/doc/book/installing/docker/) for instalation Docker. 



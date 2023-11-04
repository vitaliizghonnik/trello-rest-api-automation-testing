# trello-rest-api-testing
This collection aims to test the main functionality of the Trello management tool 
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
***Note: Token should be kept secret***

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

# Testing technics used to checking the reliability of requirenments REST API
In the request called 'Create a checklist in the card of corrent collection is used blackbox testing technics used to checking the reliability requirenments 


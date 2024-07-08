# Sproutify

## Introduction
This is a plant management app that has plant identification, diagnosis, watering schedule management and marketplace features.

This app is targeted at new house plant owners, who wish to learn how to take better care of their plants and who need a tool to help them manage the plants in their home.

## Technologies Used
This project was built with
* HTML
* CSS (Framework: Bootstrap)
* JavaScript
* Ruby on Rails
* PostgreSQL

Hosting: Heroku

External APIs used
* Plant Identification API by [plant.id](https://web.plant.id/plant-identification-api/)

## Product Wireframe
[Figma wireframe](https://www.figma.com/design/C5zeWt9rcm4nN5c2TuoEBn/Sproutify-(2024-03)?node-id=841-934)

## System Design (ERD)
* users can have many plants (1:N), which may belong to collections (N:1, optional)
* plant_infos contains general plant care information. Many plants (same species) can have the same plant_info (N:1)
* illnesses contains the general illness diagnosis and treatment information. Different plants can have different illnesses (N:N)
* users can have many offers (1:N). Each offer may have a few offering options (1:N)
* messages exchanged between users belong to specific offers (N:1)

![Entity Resource Diagram](/public/sproutify-erd.PNG)

## Feature Logic
### Plant Identification and Illness Diagnosis
* After user has uploaded the image file of the plant, convert to Base64 string using the Javascript FileReader interface, readAsDataURL method.
* After conversion, append Base64 string when calling the external API.

### Watering Schedule
* Utilised [Simple Calendar Gem](https://github.com/excid3/simple_calendar)
* Compute the event days based on the watering start date and the interval

### Sharing Watering Schedule with Buddy
* Generate a unique alphanumeric token for each user using Rails SecureRandom function, which will be used as the uuid for the consolidated watering schedule
* Retrieve watering schedule data using the uuid (via .find_by_token() method), to display in the view

### Marketplace
Making an offer is a 2-step process
* Upon clicking “Offer to Swap”, offers controller creates new offer instance in DB
* After user has submitted offering option(s), offering_options_controller.js calls offering_options controller to create new offering_options instance(s) in DB
* offering_options_controller.js also calls offers_controller to create default chat message

## Further Development
* Improve on UI of the plant care information / illness diagnosis to include more visuals
* Automate more care reminders to reduce user effort in scheduling tasks
* Notifications for marketplace developments (e.g. incoming chat message)

## Team Members
* Feng Yong
* Melvin
* Zi Jie
* Yin Yun
* Tuck Seng

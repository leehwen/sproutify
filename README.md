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

Example below using diagnose illness feature:
```javascript
convert (e) {
    const file = e.target.files[0];
    const reader = new FileReader();

    reader.readAsDataURL(file);

    reader.onload = (e) => {
      const base64String = e.target.result;
      document.querySelector("#loader").classList.remove("d-none")
      this.#diagnose( base64String );
    };
  }
```

### Watering Schedule
* Utilised [Simple Calendar Gem](https://github.com/excid3/simple_calendar)
* Compute the event days based on the watering start date and the interval

```ruby
def schedule(given_date = nil)
  return [] if watering_frequency.nil?
  return [] if start_date.nil?

  if given_date.nil? || Date.parse(given_date).beginning_of_month == start_date.beginning_of_month
    dates = []
    instances = 120 / watering_frequency
    instances.times do |index|
      dates << OpenStruct.new(
        nickname:,
        watering_date: start_date + (index * watering_frequency).days
      )
    end
    dates
  elsif Date.parse(given_date).beginning_of_month < start_date.beginning_of_month
    []
  else
    calendar_start_date = Date.parse(given_date).beginning_of_month
    dates = []
    difference = (calendar_start_date - start_date).abs
    offset = ((difference / watering_frequency).ceil * watering_frequency) - difference
    instances = 60 / watering_frequency
    instances.times do |index|
      dates << OpenStruct.new(
        nickname:,
        watering_date: (calendar_start_date + offset) + (index * watering_frequency).days
      )
    end
    dates
  end
end
```

### Sharing Watering Schedule with Buddy
* Generate a unique alphanumeric token for each user using Rails SecureRandom function, which will be used as the uuid for the consolidated watering schedule
* Retrieve watering schedule data using the uuid (via .find_by_token() method), to display in the view

```ruby
def share
  @user = User.find_by_token(params[:token])
  @plants = @user.plants
  @full_schedule = @plants.map { |plant| plant.schedule(params[:start_date]) }.flatten
  authorize @plants
end
```

### Marketplace
Making an offer is a 2-step process
* Upon clicking “Offer to Swap”, offers controller creates new offer instance in DB

```ruby
def create
  @lister_plant = Plant.find(params[:create_offer][:lister_plant_id])
  @lister = @lister_plant.user

  existing_offer = existing_offer(@lister.id, @lister_plant.id)

  if existing_offer.empty?
    @offer = Offer.new(lister_plant_id: @lister_plant.id, lister_id: @lister.id, accepted: "pending", buyer_id: current_user.id)
    if @offer.save
      redirect_to offer_offering_options_new_path(@offer)
    else
      redirect_to listing_plant_path(@lister_plant), alert: @offer.errors.messages.values[0]
    end
  else
    redirect_to listing_plant_path(@lister_plant), alert: "You already have a pending offer for this plant"
  end
end
```
* After user has submitted offering option(s), offering_options_controller.js calls offering_options controller to create new offering_options instance(s) in DB
* offering_options_controller.js also calls offers_controller to create default chat message

```javascript
create (e) {
  this.offerId = e.currentTarget.dataset.offerId
  const url = `/offers/${this.offerId}/offering_options`

  e.currentTarget.classList.add("d-none")
  fetch(url, {
    method: "POST",
    headers: {
      "Accepts": "application/json",
      "Content-Type": "application/json",
      "X-CSRF-Token": this.#getMetaValue("csrf-token")
    },
    body: JSON.stringify({ids: this.offeringOptionIds})
  })
  .then(res => res.json())
  .then(data => {
    console.log(this.chatButtonTarget)
    console.log(data);
    this.chatButtonTarget.classList.remove("d-none")
    // target
    // change the button
    Swal.fire({
      title: 'Offer is made',
      text: 'Continue to chat with the owner',
      icon: 'success',
      confirmButtonText: 'Cool'
    })
    // create default message in chatroom
    this.#createDefaultMessage()
    // disable options
    this.offeringTargets.forEach((offering) => {
      offering.classList.add("disabled")
    })
  })
}
```

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

import { Controller } from "@hotwired/stimulus"
import Swal from 'sweetalert2'

// Connects to data-controller="offering-option"
export default class extends Controller {

  static targets = ["selectedOffering", "chatButton"]

  connect() {
    console.log('connected')

    this.offeringOptionIds = [];
  }

  add (e) {
    const id = e.currentTarget.dataset.plantId;

    if (this.offeringOptionIds.includes(id)) {
      // deselect the plant by removing from array
      const position = this.offeringOptionIds.findIndex((element) => element == id)
      this.offeringOptionIds.splice(position, 1);
      e.currentTarget.classList.remove("active");
    } else {
      if (this.offeringOptionIds.length >= 5 ) {
      // alert
        Swal.fire({
          title: 'Reached the maximum',
          text: 'You can choose at most 5 plants',
          icon: 'warning',
          confirmButtonText: 'Ok'
        })
      } else {
        e.currentTarget.classList.add("active");
        this.offeringOptionIds.push(id);
        // this.updateOfferingHTML(id); // remove calling this method
      }
    }


    // this.offeringOptionIds = Array.from(new Set(this.offeringOptionIds))

  }

  // updateOfferingHTML(id) {
  //   const url = `/plants/${id}/offering_option`;

  //   fetch(url)
  //     .then(res => res.text())
  //     .then(data => {
  //       console.log(data);

  //       this.selectedOfferingTarget.insertAdjacentHTML(
  //         "beforeend",
  //           data
  //         )
  //         window.scrollTo(0, document.body.scrollHeight);
  //     })
  // }

  create (e) {
    this.offerId = e.currentTarget.dataset.offerId
    const url = `/offers/${this.offerId}/offering_options`
    // console.log(this.#getMetaValue("csrf-token"));
    // console.log(JSON.stringify(this.offeringOptionIds));
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
    })
  }

  #createDefaultMessage() {
    const url = `/offers/${this.offerId}/default_message`

    fetch(url, {
      method: "POST",
      headers: {
        "Accepts": "application/json",
        // "Content-Type": "application/json",
        "X-CSRF-Token": this.#getMetaValue("csrf-token")
      }
    })
    .then(res => res.json())
    .then(data => {
      console.log(data);
    })
  }

  #getMetaValue(name) {
    const element = document.head.querySelector(`meta[name="${name}"]`)
    return element.getAttribute("content")
  }
}

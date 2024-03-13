import { Controller } from "@hotwired/stimulus"

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
      // alert
    } else {
      if (this.offeringOptionIds.length > 5 ) {
      // alert
        console.log('rejected');
      } else {
        this.offeringOptionIds.push(id);
        this.updateOfferingHTML(id);
      }
    }


    // this.offeringOptionIds = Array.from(new Set(this.offeringOptionIds))

  }

  updateOfferingHTML(id) {
    const url = `/plants/${id}/offering_option`;

    fetch(url)
      .then(res => res.text())
      .then(data => {
        console.log(data);

        this.selectedOfferingTarget.insertAdjacentHTML(
          "beforeend",
            data
          )
          window.scrollTo(0, document.body.scrollHeight);
      })
  }

  create (e) {
    const url = `/offers/${e.currentTarget.dataset.offerId}/offering_options`
    // console.log(this.#getMetaValue("csrf-token"));
    // console.log(JSON.stringify(this.offeringOptionIds));
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
    })
  }


  #getMetaValue(name) {
    const element = document.head.querySelector(`meta[name="${name}"]`)
    return element.getAttribute("content")
  }
}

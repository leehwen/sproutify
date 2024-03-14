import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="plant-listing"
export default class extends Controller {
  static targets = ["form", "checkbox"]

  connect() {
    console.log("hello plant-listing-controller");
  }

  fire(event) {
    event.preventDefault();
    const status = this.checkboxTarget.checked;
    const plantId = this.formTarget.dataset.plantId;
    const url = `/plants/${plantId}/update-listing?status=${status}`

    fetch(url, {
      method: "PATCH",
      headers: {
        "Accept": "application/json",
        "X-CSRF-Token": this.#getMetaValue("csrf-token")
      }
    })
    .then(response => response.json())
    .then((data) => {
      console.log(data);
    });

  }

  #getMetaValue(name) {
    const element = document.head.querySelector(`meta[name="${name}"]`)
    return element.getAttribute("content")
  }

}

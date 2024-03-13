import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="offer-select"
export default class extends Controller {

  static targets = ["content", "option"]

  connect() {
    console.log("Hello offer-select controller")
  }

  select(event) {
    this.optionTargets.forEach((option) => {
      option.classList.remove("border-success")
      option.classList.remove("border-4")
      option.classList.add("border-black")
    })
    event.currentTarget.classList.add("border-success")
    event.currentTarget.classList.add("border-4")
    event.currentTarget.classList.remove("border-black")

    this.offerId = event.currentTarget.dataset.offerId
    this.selectedPlantId = event.currentTarget.dataset.plantId
  }

  accept(event) {
    event.preventDefault();
    const url = `/offers/${this.offerId}/accept?selectedPlantId=${this.selectedPlantId}`

    fetch(url, {
      method: "PATCH",
      headers: {
        "Accept": "text/plain",
        "X-CSRF-Token": this.#getMetaValue("csrf-token")
      }
    })
    .then(response => response.text())
    .then(data => {
      this.contentTarget.innerHTML = data;
    })
  }

  #getMetaValue(name) {
    const element = document.head.querySelector(`meta[name="${name}"]`)
    return element.getAttribute("content")
  }

}

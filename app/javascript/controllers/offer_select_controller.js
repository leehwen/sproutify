import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="offer-select"
export default class extends Controller {

  static targets = ["content", "option", "popup", "swapImage"]

  connect() {
    console.log("Hello offer-select controller")
  }

  select(event) {
    this.optionTargets.forEach((option) => {
      option.classList.remove("active")
    })
    event.currentTarget.classList.add("active")

    this.offerId = event.currentTarget.dataset.offerId
    this.selectedPlantId = event.currentTarget.dataset.plantId
  }

  accept(event) {
    event.preventDefault();
    const url = `/offers/${this.offerId}/accept?selectedPlantId=${this.selectedPlantId}`

    fetch(url, {
      method: "PATCH",
      headers: {
        "Accept": "application/json",
        "X-CSRF-Token": this.#getMetaValue("csrf-token")
      }
    })
    .then(response => response.json())
    .then(data => {
      console.log(data);
      this.contentTarget.innerHTML = data.options;
      this.swapImageTarget.setAttribute("src", data.swap_image)
      this.popupTarget.classList.add("active");
    })
  }

  #getMetaValue(name) {
    const element = document.head.querySelector(`meta[name="${name}"]`)
    return element.getAttribute("content")
  }

}

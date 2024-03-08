import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="mygarden"
export default class extends Controller {
  static targets = ["collectionHeader", "plantsHeader", "collection", "plants"]
  
  connect() {
    console.log("hello")
  }

  toggleCollection() {
    this.collectionHeaderTarget.classList.remove("disabled");
    this.plantsHeaderTarget.classList.add("disabled");
    this.collectionTarget.classList.remove("d-none")
    this.plantsTarget.classList.add("d-none");
  }

  togglePlant() {
    this.collectionHeaderTarget.classList.add("disabled");
    this.plantsHeaderTarget.classList.remove("disabled");
    this.collectionTarget.classList.add("d-none")
    this.plantsTarget.classList.remove("d-none");
  }
}

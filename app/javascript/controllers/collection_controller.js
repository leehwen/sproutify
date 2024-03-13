import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="collection"
export default class extends Controller {
  static targets = ["show", "hide", "header"]
  
  connect() {
  }

  show(){
    this.showTarget.classList.remove("d-none");
    this.headerTarget.classList.add("d-none");
  }
}

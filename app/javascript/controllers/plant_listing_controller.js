import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="plant-listing"
export default class extends Controller {
  static targets = ["checkbox"]

  connect() {
    console.log("hello plant-listing-controller");
  }

  fire() {
  let status = this.checkboxTarget.checked;

  fetch(`/plants/:id/update-listing?status=${status}`)
  .then(response => response.json())
  .then((data) => {
    console.log(data);
  });

  // half done

  }

}

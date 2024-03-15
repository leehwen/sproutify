import { Controller } from "@hotwired/stimulus"
import Swal from 'sweetalert2'


// Connects to data-controller="plant-listing"
export default class extends Controller {
  static targets = ["form", "checkbox", "status"]

  connect() {
    // console.log("hello plant-listing-controller");
    console.log(this.checkboxTarget);
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
      // console.log(status);
      if (status === true) {
        Swal.fire({
          title: 'Great',
          text: 'It is listed to the marketplace',
          icon: 'success',
          confirmButtonText: 'Cool'
        });
        this.statusTarget.innerText = "Already listed"
        } else {
          Swal.fire({
            title: 'Noted',
            text: 'Removed from the marketplace',
            icon: 'info',
            confirmButtonText: 'Cool'
          });
          this.statusTarget.innerText = "List in Marketplace"
        }
    });

  }

  #getMetaValue(name) {
    const element = document.head.querySelector(`meta[name="${name}"]`)
    return element.getAttribute("content")
  }

}

import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="offering-option"
export default class extends Controller {
  connect() {
    console.log('connected')

    this.offeringOptionIds = [];
  }

  add (e) {
    const id = e.currentTarget.dataset.plantId;
    this.offeringOptionIds.push(id);

    this.offeringOptionIds = Array.from(new Set(this.offeringOptionIds))

    if (this.offeringOptionIds.length > 2 ) {
      console.log('rejected');
    } else {
      this.updateOfferingHTML(id);
    }
  }

  updateOfferingHTML(id) {
    const url = `/plants/${id}/offering_option`;

    fetch(url)
      .then(res => res.text())
      .then(data => {
        console.log(data);
      })
  }
}

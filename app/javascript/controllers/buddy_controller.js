import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="buddy"
export default class extends Controller {
  static targets = ["addBuddy", "addBuddyHeader", "buddySelect", "selectBuddy", "form"]
  
  connect() {
  }

  show(){
    this.addBuddyTarget.classList.toggle("d-none");
    this.addBuddyHeaderTarget.classList.toggle("d-none");
  }

  submitBuddy(e) {
    e.preventDefault();
    const url = this.addBuddyTarget.action;
    fetch(url, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.addBuddyTarget)})
      .then(response => response.json())
      .then((data) => {
        console.log(this.formTarget.innerHTML)
        if (data.status === false) {
        this.addBuddyTarget.innerHTML = data.info;
        } else {
          window.location.reload();
        }
        this.buddySelect.outerHTML = data;
    })

  }
}

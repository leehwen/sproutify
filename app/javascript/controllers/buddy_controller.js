import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="buddy"
export default class extends Controller {
  static targets = ["addBuddy", "addBuddyHeader", "buddySelect", "selectBuddy", "addBuddy2"]
  
  connect() {
  }

  show(){
    this.addBuddyTarget.classList.toggle("d-none");
    this.addBuddyHeaderTarget.classList.toggle("d-none");
  }

  show2(){
    this.addBuddy2Target.classList.toggle("d-none");
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
        if (data.status === false) {
        this.addBuddyTarget.innerHTML = data.info;
        } else {
          window.location.reload();
        }
    })

  }

  submitBuddy2(e) {
    e.preventDefault();
    const url = this.addBuddy2Target.action;
    fetch(url, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.addBuddy2Target)})
      .then(response => response.json())
      .then((data) => {
        if (data.status === false) {
        this.addBuddy2Target.innerHTML = data.info;
        } else {
          window.location.reload();
        }
    })

  }
}

import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="buddy"
export default class extends Controller {
  static targets = ["addBuddy", "addBuddyHeader", "buddySelect", "selectBuddy"]
  
  connect() {
  }

  show(){
    this.addBuddyTarget.classList.toggle("d-none");
    this.addBuddyHeaderTarget.classList.toggle("d-none");
  }


  // submitBuddy(e) {
  //   e.preventDefault;
  //   const url = this.addBuddyTarget.action;
  //   fetch(url, {
  //     method: "POST",
  //     headers: { "Accept": "text/plain" },
  //     body: new FormData(this.addBuddyTarget)
  //   })
  //     .then(response => response.text())
  //     .then((data) => {
  //       console.log(data)
  //       // this.buddySelect.outerHTML = data;
  //     })

  // }
}

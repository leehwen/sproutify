import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="collection"
export default class extends Controller {
  static targets = ["show", "hide", "header", "display", "form"]

  connect() {
  }

  show(){
    this.showTarget.classList.remove("d-none");
    this.headerTarget.classList.add("d-none");
  }

  fire(e){
    e.preventDefault();

    const url = `${this.showTarget.action}`;
    console.log(this.showTarget);

    document.querySelector("#loader").classList.remove("d-none")

    fetch(url, {
      method: "POST",
      headers: {"Accept": "application/json"},
      body: new FormData(this.showTarget)})
    .then(response => response.json())
    .then((data) => {
      // this.displayTarget.outerHTML = data
      console.log(data)
      if (data.status === false) {
      this.showTarget.innerHTML = data.info
      document.querySelector("#loader").classList.add("d-none") }
      else {
        window.location.reload();
      }
      // this.displayTarget.classList.add("d-none");
      // this.headerTarget.classList.add("d-none");
    })
  }


}

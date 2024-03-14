import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="collection"
export default class extends Controller {
  static targets = ["show", "hide", "header", "display"]
  
  connect() {
  }

  show(){
    this.showTarget.classList.remove("d-none");
    this.headerTarget.classList.add("d-none");
  }

  fire(e){
    e.preventDefault();
    
    const url = `${this.showTarget.action}`
    console.log(this.showTarget.action);

    fetch(url, {headers: {"Accept": "text/plain"}})
    .then(response => response.text())
    .then((data) => {
      this.displayTarget.outerHTML = data
      this.showTarget.classList.add("d-none");
    })
  }
}

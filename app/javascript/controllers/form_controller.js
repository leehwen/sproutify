import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {
  connect() {
    console.log('form connected')
  }

  handleSubmit() {
    debugger
    document.querySelector("#loader").classList.remove("d-none")
  }
}

import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input", "button"]

  static values = { feedbackText: String }

  connect() {
    // console.log("connected copy");
  }

  copy() {
    navigator.clipboard.writeText(this.inputTarget.value);
    // this.buttonTarget.classList.add("disabled");
    // this.buttonTarget.innerText = this.feedbackTextValue;
  }

  toggle() {
    console.log(this.buttonTarget)
    this.buttonTarget.classList.toggle("d-none");
  }
}

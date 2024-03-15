import { Controller } from "@hotwired/stimulus";
import Swal from 'sweetalert2'

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
    Swal.fire({
      title: "Link copied successfully!",
      text: "Share the link with your buddy!",
      icon: "success"
    });
  }

  toggle() {
    // console.log(this.buttonTarget)
    this.buttonTarget.classList.toggle("d-none");
  }
}

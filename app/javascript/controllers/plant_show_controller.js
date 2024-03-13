import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="plant-show"
export default class extends Controller {
  static targets = ["content", "menuHeader"]

  connect() {
  }


  displayContent(e) {
    this.menuHeaderTargets.forEach(menu => menu.classList.remove("active"))

    e.target.classList.add("active");
    const targetContent = e.target.dataset.header;

    this.contentTargets.forEach(content => {
      content.classList.add("d-none");
      if (content.dataset.content === targetContent) {
        content.classList.remove("d-none");
      }
    })
  }

  displayCalendar(e) {
    console.log("bingo")
  }
}

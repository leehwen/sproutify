import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="plant-show"
export default class extends Controller {
  static targets = ["content", "menuHeader"]

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

  handleClick(e) {
    e.preventDefault();
    // get the url of that link
    let url = e.currentTarget.href;
    // add the #watering-schedule at the end of the link
    url = url + "#calendar"
    // proceed with the default flow
    window.location.replace(url);
  }
}

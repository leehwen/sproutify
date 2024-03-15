import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="offer-subscription"
export default class extends Controller {
  static values = { offerId: Number }
  static targets = ["messages", "scroller"]

  connect() {
    const offsetHeight = document.querySelector(".nav").offsetHeight
    this.element.style.height = `calc(100vh - ${offsetHeight}px)`
    this.scrollerTarget.scrollTo(0, this.messagesTarget.scrollHeight)

    this.channel = createConsumer().subscriptions.create(
      { channel: "OfferChannel", id: this.offerIdValue },
      { received: data => this.#insertMessageAndScrollDown(data) }
    )
  }

  #insertMessageAndScrollDown(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    this.scrollerTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

  resetForm(event) {
    event.target.reset()
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }

}

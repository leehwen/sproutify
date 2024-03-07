import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="camera"
export default class extends Controller {
  // static targets = ["image"]
  static values = {
    apiKey: String
  }

  connect() {
    console.log("connected")
    console.log(this.apiKeyValue)
  }

  identify(e) {

    // console.log(e)
    const file = e.target.files[0];
    const reader = new FileReader();

    reader.readAsDataURL(file);

    reader.onload = (e) => {
      const base64String = e.target.result;
      // console.log(base64String);
      this.#callapi(base64String)
    };
  }

  #callapi(base64String) {
    const url = "https://plant.id/api/v3/identification"
    fetch(url, {
      method: "POST",
      headers: {"Content-Type": "application/json", "Api-Key": this.apiKeyValue },
      body: JSON.stringify({"images": [base64String], "similar_images": true})
    })
    .then(response => response.json())
    .then((data) => {
      console.log(data)
      // pass this data to the partial
    })
  }
}

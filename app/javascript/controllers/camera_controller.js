import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="camera"
export default class extends Controller {
  static targets = ["results"]

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
    const url = "https://plant.id/api/v3/identification?details=common_names,description,image,propagation_methods,watering";

    fetch(url, {
      method: "POST",
      headers: {"Content-Type": "application/json", "Api-Key": this.apiKeyValue },
      body: JSON.stringify({"images": [base64String], "similar_images": true})
    })
    .then(response => response.json())
    .then((data) => {
      const info = data.result.classification.suggestions[0];
      console.log(info)
      const info_t = JSON.stringify({ 
        data: info
      });
      const url2 = "/identify/results"
      
      // fetch (url2, {
      //   method: "POST",
      //   headers: {
      //     "Content-Type":  "application/json",
      //     "Accept": "text/plain",
      //     "X-CSRF-Token": this.#getMetaValue("csrf-token")
      //   },
      //   body: info_t })
        // .then(response => response.json())
        // .then((data) => {
        //   console.log(data)
        //   // this.resultsTarget.outerHTML = data
        // })
    })
  }

  #getMetaValue(name) {
    const element = document.head.querySelector(`meta[name="${name}"]`)
    return element.getAttribute("content")
  }
}

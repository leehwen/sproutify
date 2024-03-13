import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="camera"
export default class extends Controller {
  static targets = ["info", "toShow", "plantInfo", "toHide", "btnShowA", "btnShowB"]

  static values = {
    apiKey: String
  }

  connect() {
    console.log("connected")
  }

  fire(e) {
    e.preventDefault;
    this.toShowTargets.forEach ((target) => {
      target.classList.remove('d-none');
    });
    this.btnShowBTarget.classList.add("d-none");
    this.btnShowATarget.classList.add("d-none");

    // const div = document.querySelector('plant-info-form');
    window.scrollTo(0, document.body.scrollHeight);
  }

  identify(e) {

    // console.log(e)
    const file = e.target.files[0];

    const reader = new FileReader();

    reader.readAsDataURL(file);

    reader.onload = (e) => {
      const base64String = e.target.result;
      // console.log(base64String);
      const results = this.#callapi(base64String)
      // this.#createPlantInfo(results)
    };
  }

  #callapi(base64String) {
    const url = "https://plant.id/api/v3/identification?details=common_names,description,image,propagation_methods,watering";

    // fetch(url, {
    //   method: "POST",
    //   headers: {"Content-Type": "application/json", "Api-Key": this.apiKeyValue },
    //   body: JSON.stringify({"images": [base64String], "similar_images": true})
    // })
    // .then(response => response.json())
    // .then((data) => {
    //   const info = data.result.classification.suggestions[0];
    //   console.log(info)
    //   const info_t = JSON.stringify({
    //     data: info
    //   });
      const url2 = "/plant_infos"

      console.log('hi')
      let info_t;

      fetch (url2, {
        method: "POST",
        headers: {
          "Content-Type":  "application/json",
          "Accept": "application/json",
          "X-CSRF-Token": this.#getMetaValue("csrf-token")
        },
        body: info_t })
        .then(response => response.json())
        .then((data) => {
          console.log(data)
          // 1. update the info
          this.infoTarget.outerHTML = data.info
          // 2. unhide all the toShowTargets
          // this.toShowTargets.forEach ((target) => {
          //   target.classList.remove('d-none');
          // });
          this.toHideTargets.forEach((t) =>{
            t.classList.add('d-none')
          })
          // 3. update the association with plant_info_id
          this.plantInfoTarget.value = data.plant_info_id

          this.btnShowATarget.classList.remove('d-none');
          this.btnShowBTarget.classList.remove('d-none');
        })
    // })
  }

  #getMetaValue(name) {
    const element = document.head.querySelector(`meta[name="${name}"]`)
    return element.getAttribute("content")
  }
}

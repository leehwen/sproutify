import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="camera"
export default class extends Controller {
  static targets = ["info", "toShow", "plantInfo", "toHide", "btnShowA", "btnShowB", "display", "form"]

  static values = {
    apiKey: String
  }

  connect() {
    console.log(this.#getEnv())
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

    const file = e.target.files[0];

    const reader = new FileReader();

    reader.readAsDataURL(file);

    reader.onload = (e) => {
      const base64String = e.target.result;
      // load the loader
      document.querySelector("#loader").classList.remove("d-none")
      const results = this.#getEnv() === 'production' ? this.#callapi(base64String) : this.#passToBackend()
      // this.#createPlantInfo(results)
    };
  }

  formSubmit (e) {
    e.preventDefault();

    const form_url = this.formTarget.action
  document.querySelector("#loader").classList.remove("d-none")

    fetch (form_url, {
      method: "POST",
      headers: {
        "Accept": "application/json",
      },
      body: new FormData(this.formTarget) })
      .then(response => response.json())
      .then((data) => {
        if (data.status === true) {
          window.location.replace(form_url);
          // save plant instance
        } else {
          document.querySelector("#loader").classList.add("d-none")
          this.displayTarget.innerHTML = data.info;
        }
      });
  }

  // this method will be called when we're on the prod server
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
      const plantInfo = JSON.stringify({
        data: info });

      this.#passToBackend(plantInfo)

    });
  }

  #passToBackend(plantInfo = null) {
    const backendUrl = "/plant_infos"

    fetch (backendUrl, {
      method: "POST",
      headers: {
        "Content-Type":  "application/json",
        "Accept": "application/json",
        "X-CSRF-Token": this.#getMetaValue("csrf-token")
      },
      body: plantInfo })
      .then(response => response.json())
      .then((data) => {
        // 1. update the info
        this.infoTarget.outerHTML = data.info;
        // 2. unhide all the toShowTargets
        // this.toShowTargets.forEach ((target) => {
          //   target.classList.remove('d-none');
          // });
        this.toHideTargets.forEach((t) =>{
          t.classList.add('d-none') });
        // 3. update the association with plant_info_id
        this.plantInfoTarget.value = data.plant_info_id;

        this.btnShowATarget.classList.remove('d-none');
        this.btnShowBTarget.classList.remove('d-none');

        document.querySelector("#loader").classList.add("d-none")
        });
  }

  #getMetaValue(n) {
    const element = document.head.querySelector(`meta[name="${n}"]`)
    return element.getAttribute("content")
  }

  #getEnv() {
    return document.head.querySelector("meta[name=rails_env]").content
  }
}

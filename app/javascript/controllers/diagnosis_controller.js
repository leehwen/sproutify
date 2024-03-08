import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="diagnosis"
export default class extends Controller {
  static values = {
    apiKey: String
  }

  static targets = ["results", "diagnose"]

  connect() {
    console.log('hello')
  }

  convert (e) {
    const file = e.target.files[0];
    const reader = new FileReader();

    reader.readAsDataURL(file);

    reader.onload = (e) => {
      const base64String = e.target.result;
      // console.log({ base64String });
      this.#diagnose( base64String );
    };
  }

  #diagnose ( base64String ) {

    const url = "https://plant.id/api/v3/health_assessment?details=local_name,description,url,treatment,common_names,cause"
    const requestDetails = {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "Api-Key": this.apiKeyValue,
      },
      body: JSON.stringify({
        "images": [
          base64String
        ],
        "similar_images": true
      })
    }

    // fetch(url, requestDetails)
    //   .then(response => response.json())
    //   .then((data) => {

    //     const illnesses = data.result.disease.suggestions;

    //     illnesses.forEach((illness) => {
    //       let body = {
    //         name: illness.name,
    //         common_names: illness.details.common_names,
    //         cause: illness.details.cause,
    //         description: illness.details.description,
    //         treatment: illness.details.treatment,
    //         image_url: illness.similar_images[0].url,
    //       }
    //       results = JSON.stringify(body);

    //       fetch('/diagnose/results/', {
    //         method: "POST",
    //         headers: {
    //           "Content-Type": "application/json",
    //           "Accept": "text/plain",
    //           "X-CSRF-Token": this.#getMetaValue("csrf-token")
    //         },
    //         body: results
    //       })
    //       .then(response => response.text())
    //       .then((HTMLstring) => {
    //         console.log(HTMLstring);
    //         this.resultsTarget.innerHTML = HTMLstring
    //       })
    //     }
    //     )
    //     }
    //   );

    const body = JSON.stringify({
      results: {
        name: "bacterial leaf spot",
        common_names: null,
        cause: null,
        description: "Bacterial leaf spot is caused by the bacteria Xanthomonas and Pseudomonas. Typical symptoms are black spots on the leaves or black-edged lesions and light and dark areas on the leaves, which usually develop on older leaves.",
        treatment: {
          "chemical": ["If necessary, apply fungicide containing azoxystrobin (GHS06: Toxic, GHS09: Environmental hazard).","If necessary, apply fungicide containing chlorothalonil (GHS05: Corrosive, GHS06: Toxic, GHS07: Harmful, GHS08: Health hazard, GHS09: Environmental hazard)."],
          "biological":["Remove weeds as well as all dead plant tissue. They may be a source of infection.","Apply ecological products for plant protection (e.g. copper-based spray)."],
          "prevention":["Use resistant species and cultivars as well as healthy, certified seeds and seedlings.","Avoid prolonged wetting of the leaves, which can be caused e.g. by overhead irrigation.","Improve the air circulation around the plant (e.g. by pruning excess foliage or increasing the spacing between plants).","Rotate crops. Avoid planting sensitive crops in infested soil.","Disinfect tools, infected flower pots, and hands to avoid disease transmission."]
        },
        image_url: "https://plant-id.ams3.cdn.digitaloceanspaces.com/similar_images/3/120/85e5ad1d14b6c0bba7e14e2f707158b0dfe77.jpg"
      }
    })

    fetch('/diagnose/results/', {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "Accept": "text/plain",
        "X-CSRF-Token": this.#getMetaValue("csrf-token")
      },
      body: body
    })
    .then(response => response.text())
    .then((HTMLstring) => {
      console.log(HTMLstring);
      this.resultsTarget.innerHTML = HTMLstring
      this.diagnoseTarget.classList.toggle("d-none")
    })
  }

  #getMetaValue(name) {
    const element = document.head.querySelector(`meta[name="${name}"]`)
    return element.getAttribute("content")
  }
}

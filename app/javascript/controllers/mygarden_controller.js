import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="mygarden"
export default class extends Controller {
  static targets = ["collectionHeader", "plantsHeader", "collection", "plants", 
                    "addCollectionHeader", "addCollectionForm", "addAnotherCollectionForm", "addAnotherCollectionHeader"]
  
  connect() {
    console.log("hello")
  }

  toggleCollection() {
    this.collectionHeaderTarget.classList.remove("clickable");
    this.collectionHeaderTarget.classList.add("index_header_toggle");
    this.plantsHeaderTarget.classList.add("clickable");
    this.plantsHeaderTarget.classList.remove("index_header_toggle");
    this.collectionTarget.classList.remove("d-none")
    this.plantsTarget.classList.add("d-none");
  }

  togglePlant() {
    this.collectionHeaderTarget.classList.add("clickable");
    this.collectionHeaderTarget.classList.remove("index_header_toggle");
    this.plantsHeaderTarget.classList.remove("clickable");
    this.plantsHeaderTarget.classList.add("index_header_toggle");
    this.collectionTarget.classList.add("d-none")
    this.plantsTarget.classList.remove("d-none");
  }

  addCollection(){
    this.addCollectionHeaderTarget.classList.add("d-none");
    this.addCollectionFormTarget.classList.remove("d-none");
  }

  addAnotherCollection(){
    this.addAnotherCollectionHeaderTarget.classList.add("d-none");
    this.addAnotherCollectionFormTarget.classList.remove("d-none");
  }
}

import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-star"
export default class extends Controller {
  static targets = ['star']

  connect() {
    console.log("toggle star connected")
  }

  toggle() {
    if (this.starTarget.classList.contains("fa-solid")) {
      this.starTarget.classList.remove("fa-solid")
      this.starTarget.classList.add("fa-regular")
    } else {
      this.starTarget.classList.remove("fa-regular")
      this.starTarget.classList.add("fa-solid")
    }
  }

}

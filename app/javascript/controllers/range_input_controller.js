import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="range-input"
export default class extends Controller {
  static targets = ["range", "text"]

  connect() {
    this.textTarget.textContent = this.rangeTarget.value
  }

  updateText() {
    this.textTarget.textContent = this.rangeTarget.value
  }
}

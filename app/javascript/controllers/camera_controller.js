import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="camera"
export default class extends Controller {
  connect() {
    console.log("camera connected")
  }

  send() {
    this.element.submit()
  }
}

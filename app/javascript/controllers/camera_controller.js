import { Controller } from "@hotwired/stimulus"
import Swal from "sweetalert2"
// Connects to data-controller="camera"
export default class extends Controller {
  static values = { nyanPath: String }

  connect() {
    console.log("camera connected")
  }

  send() {
    Swal.fire({
      title: "Processing your scan!",
      color: "#16a34a",
      background: "#fff url(/images/trees.png)",
      backdrop: `
      rgba(22, 163, 74, 0.5)
        url("${this.nyanPathValue}")
        center top
        no-repeat
      `,
      showConfirmButton: false,
      allowOutsideClick: false,
      customClass: {
        title: 'custom-title',
        popup: 'custom-popup'
      }
    });
    this.element.submit()
  }
}

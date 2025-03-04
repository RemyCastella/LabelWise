import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["tab"]

  connect() {
    console.log("TabSwitcherController connected!");
  }

  show(event) {
    event.preventDefault()
    console.log(event.curretTarget)
    this.tabTargets.forEach(tab => {
      if (tab.classList.contains("active")) {
        tab.classList.remove("active")
      }
    });
    event.currentTarget.classList.add("active")
  }
}

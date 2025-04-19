import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="shuffle"
export default class extends Controller {
  connect() {
    console.log(this.element);
    this.words = ["quickly.", "in any language."]
    this.interval = 3000
    this.index = 0
    this.element.textContent = this.words[this.index]
    this.timer = setInterval(() => {
      this.shuffle()
    }, this.interval)
  }

  disconnect() {
    clearInterval(this.timer)
  }

  shuffle() {
    this.index >= this.words.length - 1 ? this.index = 0 : this.index++
    this.element.textContent = this.words[this.index]
  }
}

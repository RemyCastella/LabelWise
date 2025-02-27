import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["step"]

  connect() {
    this.showStep(1)
  }

  next(event) {
    const nextStep = event.currentTarget.dataset.nextStep
    this.showStep(nextStep)
  }

  previous(event) {
    const prevStep = event.currentTarget.dataset.prevStep
    this.showStep(prevStep)
  }

  showStep(step) {
    this.stepTargets.forEach(target => {
      target.classlist.toggle('hidden', target.dataset.step != step)
    })
  }
}

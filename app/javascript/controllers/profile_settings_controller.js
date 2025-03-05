import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["slider", "value"];

  connect() {
    this.initializeSliders();
  }

  update(event) {
    const slider = event.target;
    const value = slider.value;
    const min = slider.min;
    const max = slider.max;
    const unit = this.getUnit(slider.id);

    // Update the displayed value
    const valueElement = slider.closest(".col-12").querySelector("[data-profile-settings-target='value']");
    if (valueElement) {
      valueElement.innerText = value + unit;
    }

    // Apply shadow-based track fill
    this.updateSliderTrack(slider, min, max);
  }

  initializeSliders() {
    this.sliderTargets.forEach(slider => {
      this.updateSliderTrack(slider, slider.min, slider.max);
      this.update({ target: slider }); // Ensure initial values are displayed
    });
  }

  updateSliderTrack(slider, min, max) {
    const percentage = ((slider.value - min) / (max - min)) * 100;
    slider.style.setProperty("--progress-width", `${percentage}%`);
  }

  getUnit(id) {
    return id === "protein" || id === "carbohydrates" || id === "fat" ? " g" :
           id === "sodium" ? " mg" :
           id === "calories" ? " kcal" : " kg";
  }
}

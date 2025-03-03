// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"
import "chartkick"
import "Chart.bundle"

document.addEventListener("DOMContentLoaded", function() {
  new TomSelect("#common-allergens-select", {
    plugins: ['remove_button'],
    maxItems: null,
    create: false,
    placeholder: "Select allergens to avoid...",
    hidePlaceholder: true
  });
});

// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"
import "chartkick"
import "Chart.bundle"

document.addEventListener("DOMContentLoaded", function () {
  const modal = document.getElementById("food-details-modal");
  const openLink = document.getElementById("see-more-link");
  const closeBtn = document.querySelector(".close-btn");

  openLink.onclick = function (event) {
      event.preventDefault();
      modal.style.display = "block";
  };

  closeBtn.onclick = function () {
      modal.style.display = "none";
  };

  window.onclick = function (event) {
      if (event.target == modal) {
          modal.style.display = "none";
      }
  };

});

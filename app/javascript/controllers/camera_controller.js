import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["video", "canvas", "uploadButton"];

  connect() {
    document.addEventListener("turbo:load", this.startCamera.bind(this)); // Restart camera when navigating
    this.startCamera();
    console.log("Camera controller connected");
  }

  disconnect() {
    this.stopCamera(); // Stop the camera when leaving the page

  }

  startCamera() {
    navigator.mediaDevices.getUserMedia({ video: { facingMode: "environment" }, audio: false })
      .then(stream => {
        this.videoTarget.srcObject = stream;
      })
      .catch(error => console.error("Camera access error:", error));
  }

  stopCamera() {
    if (this.videoTarget.srcObject) {
      this.videoTarget.srcObject.getTracks().forEach(track => track.stop());
      this.videoTarget.srcObject = null;
    }
  }

  capture() {
    const context = this.canvasTarget.getContext("2d");
    context.drawImage(this.videoTarget, 0, 0, this.canvasTarget.width, this.canvasTarget.height);

    this.uploadButtonTarget.disabled = false;
    this.canvasTarget.style.display = "block";
    this.videoTarget.style.display = "none";

    this.stopCamera(); // Stop camera after capturing
  }

  async upload() {
    const csrfToken = document.querySelector('meta[name="csrf-token"]').content;
    const image = this.canvasTarget.toDataURL("image/jpeg");
    const file = await fetch(image);
    const blob = await file.blob();

    const formData = new FormData();
    formData.append("scan[photo]", blob, "snapshot.jpeg");

    fetch("/scans", {
      method: "POST",
      headers: { "X-CSRF-Token": csrfToken, "Accept": "application/json" },
      body: formData
    })
    .then(response => response.json())
    .then(data => console.log("Upload successful:", data))
    .catch(error => console.error("Upload failed:", error));
  }
}

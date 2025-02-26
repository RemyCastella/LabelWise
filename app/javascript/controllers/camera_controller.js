import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["video", "canvas", "captureButton", "uploadButton"];

  connect() {
    this.startCamera();
  }

  startCamera() {
    navigator.mediaDevices.getUserMedia({ video: { facingMode: "environment" }, audio: false })
      .then(stream => {
        this.videoTarget.srcObject = stream;
      })
      .catch(error => console.error("Camera access error:", error));
  }

  capture() {
    const context = this.canvasTarget.getContext("2d");
    context.drawImage(this.videoTarget, 0, 0, this.canvasTarget.width, this.canvasTarget.height);

    this.uploadButtonTarget.disabled = false; // Enable upload button after capture
    this.canvasTarget.style.display = "block";
    this.videoTarget.style.display = "none";

    // Stop the camera stream
    const stream = this.videoTarget.srcObject;
    if (stream) {
      stream.getTracks().forEach(track => track.stop());
    }
  }

  async upload() {
    const csrfToken = document.querySelector('meta[name="csrf-token"]').content;

    // Convert canvas image to Blob
    const image = this.canvasTarget.toDataURL("image/jpeg");
    const file = await fetch(image);
    const blob = await file.blob();

    const formData = new FormData();
    formData.append("scan[photo]", blob, "snapshot.jpeg");

    fetch("/scans", {
      method: "POST",
      headers: {
        "X-CSRF-Token": csrfToken,
        "Accept": "application/json"
      },
      body: formData
    })
    .then(response => {
      if (!response.ok) {
        throw new Error(`HTTP error! Status: ${response.status}`);
      }
      return response.json();
    })
    .then(data => {
      console.log("Upload successful:", data);
    })
    .catch(error => {
      console.error("Upload failed:", error);
    });
  }
}

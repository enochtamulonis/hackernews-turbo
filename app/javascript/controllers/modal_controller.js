import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="modal"
export default class extends Controller {
  connect() {
    document.body.classList.add("h-screen", "overflow-hidden");
  }

  disconnect() {
    document.body.classList.remove("h-screen", "overflow-hidden");
  }
  close(e) {
    e.preventDefault();
    this.element.remove();
  }
}

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["icon"]

  initialize() {
    this.clicked = false;
  }

  heart(e) {
    e.preventDefault();

    if (this.clicked) {
      this.iconTarget.classList.remove('fas')  // s = solid
      this.iconTarget.classList.add('far')     // r = regular
      this.clicked = false
    } else {
      this.iconTarget.classList.remove('far')
      this.iconTarget.classList.add('fas')
      this.clicked = true
    }
  }
}

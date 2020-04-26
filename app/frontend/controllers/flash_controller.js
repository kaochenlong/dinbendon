import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["alert"]
  close() {
    this.alertTarget.classList.add('d-none')
  }

  
}
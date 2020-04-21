import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["content", "submit"]

  check(e) {
    if (this.contentTarget.value.length >= 2) {
      console.log('ok');
    }
  }
}

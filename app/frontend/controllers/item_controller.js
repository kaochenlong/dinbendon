import { Controller } from "stimulus"
import ax from "axios"

export default class extends Controller {
  static targets = ["icon"]

  initialize() {
    this.clicked = false;
  }

  heart(e) {
    e.preventDefault();

    const csrfToken = document.querySelector('[name=csrf-token]').content
    ax.defaults.headers.common['X-CSRF-TOKEN'] = csrfToken

    ax.post('/api/v1/items/4/favorite')
      .then(function(resp) {
        console.log(resp.data);
      })
      .catch(function(err) {
        console.log(err);
      })

    // api request

    // if (this.clicked) {
    //   this.iconTarget.classList.remove('fas')  // s = solid
    //   this.iconTarget.classList.add('far')     // r = regular
    //   this.clicked = false
    // } else {
    //   this.iconTarget.classList.remove('far')
    //   this.iconTarget.classList.add('fas')
    //   this.clicked = true
    // }
  }
}

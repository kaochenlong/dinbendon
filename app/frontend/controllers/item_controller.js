import { Controller } from "stimulus"
import Rails from "@rails/ujs"

export default class extends Controller {
  static targets = ["icon","item_id" ]

  heart(e) {
    e.preventDefault();

    let item_id = document.querySelector('#item_id').value;

    Rails.ajax({
      url: `/api/v1/items/${item_id}/favorite`, 
      type: 'POST', 
      success: resp => {
        if (resp.status === "favorited") {
          this.iconTarget.classList.remove('far');
          this.iconTarget.classList.add('fas');
        } else {
          this.iconTarget.classList.remove('fas');
          this.iconTarget.classList.add('far');
        }
      }, 
      error: err => {
        console.log(err);
      } 
    })
  }

  additem(e) {
    e.preventDefault();

    let item_id = this.item_idTarget.value;
    console.log(item_id);

    Rails.ajax({
      url: `/items/${item_id}/add_to_cart`, 
      type: 'POST', 
      success: resp => {
        document.querySelector('#items_count').innerText = resp.items_count 
      }, 
      error: err => {
        console.log(err);
      } 
    })

  }
}

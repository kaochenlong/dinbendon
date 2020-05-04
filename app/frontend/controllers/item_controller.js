import { Controller } from "stimulus"
import Rails from "@rails/ujs"

export default class extends Controller {
  static targets = ["icon","itemId" ]

  heart(e) {
    e.preventDefault();

    let itemId = document.querySelector('#item_id').value;

    Rails.ajax({
      url: `/api/v1/items/${itemId}/favorite`, 
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

  addItem(e) {
    e.preventDefault();
    let itemId = this.itemIdTarget.value;
    Rails.ajax({
      url: `/items/${itemId}/add_to_cart`, 
      type: 'POST', 
      success: resp => {
        let event  = new CustomEvent('addItemToCart', { 'detail': resp.items_count });
        document.dispatchEvent(event );
      }, 
      error: err => {
        console.log(err);
      } 
    })

  }
}

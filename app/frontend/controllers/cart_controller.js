import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["myCart", "cartCounter"]  

  updateCart(e){    
    this.myCartTarget.classList.add('shake');
    this.cartCounterTarget.innerText = e.detail; 
    let self = this;

    setTimeout(function(){
      self.myCartTarget.classList.remove('shake');
    }, 500);

  }

}

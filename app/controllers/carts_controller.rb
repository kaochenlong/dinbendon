class CartsController < ApplicationController

  def destroy
    session[:carty] = nil
    redirect_to root_path, notice: '購物車已清空'
  end

  def checkout
    @order = Order.new

    gateway = Braintree::Gateway.new(
      environment: :sandbox,
      merchant_id: 'jwb8xz5rcmwgrxx8',
      public_key: 'd22xqv3rnmm5m5kx',
      private_key: '0d86c945075de33c3e1eafbf8cd2506e'
    )

    @token = gateway.client_token.generate
  end
end

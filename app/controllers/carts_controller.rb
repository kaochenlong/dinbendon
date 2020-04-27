class CartsController < ApplicationController

  def destroy
    session[:carty] = nil
    redirect_to root_path, notice: '購物車已清空'
  end

  def checkout
    @order = Order.new
  end
end

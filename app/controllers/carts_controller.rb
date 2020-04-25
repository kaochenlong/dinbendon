class CartsController < ApplicationController

  def destroy
    session[:carty] = nil
    redirect_to root_path, notice: '購物車已清空'
  end
end

class UsersController < ApplicationController
  def login
  end

  def sign_up
    @user = User.new
  end

  def registration
    @user = User.new(user_params)
    if @user.save
      # 成功
      # TODO: 密碼加密
      # TODO: 幫登入
      redirect_to "/"
    else
      # 失敗
      render :sign_up
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, 
                                 :password, 
                                 :password_confirmation)
  end
end

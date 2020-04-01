class UsersController < ApplicationController
  def login
  end

  def sign_up
    @user = User.new
  end

  def registration
    if user_params[:password] == user_params[:password_confirm]
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
    else
      redirect_to "/sign_up"
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, 
                                 :password, 
                                 :password_confirm)
  end
end

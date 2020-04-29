class UsersController < ApplicationController
  skip_before_action :check_login

  def login
    @user = User.new
  end

  def sign_up
    @user = User.new
  end

  def sign_in
    user = User.find_by(email: user_params[:email], 
                        password: user_params[:password])

    if user 
      session[:ccc9527] = user.id
      redirect_to root_path
    else
      redirect_to login_path
    end
  end

  def registration
    @user = User.new(user_params)
    if @user.save
      session[:ccc9527] = @user.id
      # TODO: 密碼加密
      redirect_to root_path
    else
      # 失敗
      render :sign_up
    end
  end

  def logout
    reset_session
    redirect_to root_path
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(update_params)
      redirect_to root_path, notice: 'user update!'
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:email,
                                 :nickname, 
                                 :password, 
                                 :password_confirmation)
  end

  def update_params
    if params[:user][:password].blank?
      update_info_params
    else
      update_password_params
    end  
  end

  def update_info_params
    params.require(:user).permit(:nickname,
                                 :tel,
                                 :name)
  end
  def update_password_params
    params.require(:user).permit(:nickname,
                                 :tel,
                                 :name,
                                 :password,
                                 :password_confirmation)
  end

end

class UsersController < ApplicationController

  def login
  end

  def sign_up
  end

  def registration
    user = params[:user]
    if user[:password] == user[:password_confirm]
      redirect_to "/login"
    else
      redirect_to "/sign_up"
    end
  end
end

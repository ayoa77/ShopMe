class SessionsController < ApplicationController
  def new
  end

  def create
   if params[:provider].present?
    user = User.from_omniauth(env["omniauth.auth"])
       session[:user_id] = user.id
       redirect_to user_path(user), notice: "logged in!"
    else
    user = User.find_by_email(params[:sessions][:email])
    if user && user.authenticate(params[:sessions][:password])
      session[:user_id] = user.id
      redirect_to user_path(user), notice: "logged in!"
    else
      flash.now.alert = "Email or password is invalid"
      render "new"
    end
  end
  end
  def destroy
    session[:user_id] = nil
   redirect_to login_path
  end
end

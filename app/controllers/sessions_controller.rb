class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:sessions][:email])
    if user && user.authenticate(params[:sessions][:password])
      session[:id] = user.id
      redirect_to root_path, notice: "logged in!"
    else
      flash.now.alert = "Email or password is invalid"
      render "new"
    end
  end
  def destroy
    session[:user_id] = nil
   redirect_to login_path
  end
end

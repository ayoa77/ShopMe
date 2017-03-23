class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if user_params[:password] != params[:user][:password_confirmation]
      render 'new', notice: 'Sorry your passwords do not match!'
    elsif @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Thanks for signing up!'
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email,
                                 :username,
                                 :name,
                                 :website,
                                 :email,
                                 :about,
                                 :gender,
                                 :password,
                                 :profile_photo,
                                 :provider,
                                 :uid,
                                 :oauth_expires_at,
                                 :oauth_token
                                )
  end


end

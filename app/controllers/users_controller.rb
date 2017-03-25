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

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order('created_at DESC')
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.update(user_params)
    @user = User.find(params[:id])
      redirect_to user_path(@user)
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
                                 :remove_profile_photo,
                                 :provider,
                                 :uid,
                                 :oauth_expires_at,
                                 :oauth_token
                                )
  end
end

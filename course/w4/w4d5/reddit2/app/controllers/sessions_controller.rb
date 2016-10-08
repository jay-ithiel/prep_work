class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    @user.reset_session_token!
    session[:session_token] = @user.session_token

    redirect_to :user_url(@user)
  end

  def destroy
    @user.reset_session_token!
    session[:session_token] = nil

    redirect_to new_session_url
  end
end
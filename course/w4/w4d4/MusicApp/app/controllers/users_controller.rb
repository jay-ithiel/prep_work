class UsersController < ApplicationController
  before_action :ensure_user_online, only: :show

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in_user!(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :session_token)
    end
end

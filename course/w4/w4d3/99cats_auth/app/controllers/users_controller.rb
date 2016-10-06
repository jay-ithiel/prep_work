class UsersController < ApplicationController

  before_action :signed_in?, only: [:create, :new]

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login_user!(@user)
      send_welcome_email
      redirect_to cats_url
    else
      render :new
    end
  end


  private

    def send_welcome_email
      msg = UserMailer.welcome_email(@user)
      msg.deliver
    end

    def user_params
      params.require(:user).permit(:user_name, :password)
    end

end

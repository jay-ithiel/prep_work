class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find(params[:id])
    if @user.save
      login!(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :password)
    end
end

class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find(params[:id])
    if @user.save
      
    else

    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :password)
    end
end

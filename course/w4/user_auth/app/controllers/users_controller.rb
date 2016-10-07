class UsersController < ApplicationController
  def index
    render :index
  end

  def new
  end

  def create
  end

  private
    def user_params
      params.require(:user).permit(:name, :password)
    end
end

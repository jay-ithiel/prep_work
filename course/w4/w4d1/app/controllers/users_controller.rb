class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find_by_id(params[:id])
    render json: @user
  end

  def update
    @user = User.find(params[:id])

    if @user.nil?
      render @user.errors.full_messages
    else
      # @user.username = params[:user][:username]
            # @contact.update(contact_params)
      @user.update(user_params)
    end

    # redirect_to @users_url
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render(
        json: @user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    @user = User.find(params[:id])

    if @user.nil?
      render text: "user does not exist"
    else
      User.find(params[:id]).destroy
    end

    render json: @user
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end

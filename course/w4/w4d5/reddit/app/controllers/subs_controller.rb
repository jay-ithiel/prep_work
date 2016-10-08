class SubsController < ApplicationController
  before_action :ensure_mod_owner, only: [:edit, :update]
  before_action :ensure_logged_in, only: [:new, :create]

  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.mod_id = current_user.id

    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def edit
    current_sub
    render :edit
  end

  def update
    current_sub
    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def show
    current_sub
    render :show
  end

  def index
    @subs = Sub.all
    render :index
  end

  private
    def current_sub
      @sub ||= Sub.find(params[:id])
    end

    def ensure_mod_owner
      unless current_user && current_sub.mod_id == current_user.id
        flash[:errors] = ["You are not authorized"]
        if current_user
          redirect_to sub_url(params[:id])
        else
          redirect_to new_session_url
        end
      end
    end

    def sub_params
      params.require(:sub).permit(:title, :description)
    end
end

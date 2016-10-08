class PostsController < ApplicationController

  before_action :ensure_logged_in, except: :show
  before_action :ensure_post_author, only: [:edit, :update]

  def new
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    # @post.sub_id = params[:sub_id]
    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def destroy
    title = current_post.title
    # id = current_post.sub_id
    current_post.destroy
    flash[:errors] = ["#{title} has been destroyed!"]
    redirect_to sub_url(id)
  end

  def edit
    current_post
    render :edit
  end

  def update
    current_post
    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def show
    current_post
    render :show
  end

  private
    def current_post
      @post ||= Post.includes(:author).find(params[:id])
    end

    def ensure_post_author
      unless current_user && current_user.id == current_post.author_id
        flash[:errors] = ["You are unauthorized"]
        if current_user
          redirect_to post_url(@post)
        else
          redirect_to new_session_url
        end
      end
    end

    def post_params
      params.require(:post).permit(
        :title,
        :url,
        :content,
        sub_ids: []
      )
    end

end

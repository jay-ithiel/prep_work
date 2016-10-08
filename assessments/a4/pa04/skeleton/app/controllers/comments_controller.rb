class CommentsController < ApplicationController
  before_action :ensure_logged_in

  def create
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id

    unless comment.save
      flash[:errors] = comment.errors.full_messages
    end

    redirect_to link_url(comment.link_id)
  end

  def destroy
    comment = current_user.comments.find(params[:id])
    comment.destroy

    redirect_to link_url(comment.link_id)
  end

  private

    def comment_params
      params.require(:comment).permit(:body, :link_id)
    end
end

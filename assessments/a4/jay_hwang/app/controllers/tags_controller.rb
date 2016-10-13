class TagsController < ApplicationController
  def new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to post_url(@tag.post_id)
    else
      flash[:errors] = @tag.errors.full_messages
      redirect_to post_url(@tag.post_id)
    end
  end

  def destroy
    tag = Tag.find(params[:id])
    post_id = tag.post_id
    tag.destroy
    redirect_to post_url(post_id)
  end

  private
    def tag_params
      params.require(:tag).permit(:name, :post_id)
    end
end

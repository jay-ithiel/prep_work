class CatsController < ApplicationController
  def index
    @cats = Cat.all
  end

  def show
    @cat = Cat.find(params[:id])
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      render json: @cat, status: :created
    else
      render(
        json: @cat.errors.full_messages,
        status: :unprocessable_entity
      )
    end
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update(cat_params)
      render json: @cat, status: :created
    else
      render(
        json: @cat.errors.full_messages,
        status: :unprocessable_entity
      )
    end
  end

  def new
    @cat = Cat.new
  end

  def edit
    @cat = Cat.find(params[:id])
  end

  private
    def cat_params
      params.require(:cat).permit(:name, :birth_date, :sex, :description, :color)
    end
end

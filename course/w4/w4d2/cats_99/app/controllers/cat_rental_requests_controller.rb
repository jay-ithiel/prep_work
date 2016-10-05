class CatRentalRequestsController < ApplicationController
  def new
    @rental = CatRentalRequest.new
    @cats = Cat.all
  end

  def create
    @rental = CatRentalRequest.new(rental_params)
    puts @rental
    if @rental.save
      render json: @rental, status: :created
    else
      render(
        json: @rental.errors.full_messages,
        status: :unprocessable_entity
      )
    end
  end

  private
  def rental_params
    params.require(:rental).permit(:cat_id, :start_date, :end_date, :status)
  end
end

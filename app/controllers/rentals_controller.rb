class RentalsController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @rentals = current_user.rentals
  end

  def new
  end

  def create
    @rental = Rental.new(rental_params)
    @rental.rentee = current_user
    @rental.techget = Techget.find(params[:techget_id])
    @rental.renter = @rental.techget.user
    @rental.save
    redirect_to techget_path(@rental.techget)
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def show
  end

  def rental_params
    params.require(:rental).permit(:start, :end, :comment)
  end
end

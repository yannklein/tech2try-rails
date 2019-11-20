class RentalsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_chat_room

  def index
    @rentals = Rental.all
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

  def confirm
    @rental = Rental.find(params[:id])
    @rental.confirmed = true
    @rental.save!
    redirect_to rentals_path
  end

  def update_chatbox
    @rental = Rental.find(params[:id])
    if @rental.chat_room.nil?
      chatroom = ChatRoom.new(name: "#{@rental.techget.name} - #{@rental.renter.name} & #{@rental.rentee.name}")
      chatroom.rental = @rental
      chatroom.save!
    end
    current_user.chat_room = @rental.chat_room
    current_user.save!
    redirect_to rentals_path
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def show
  end

  private

  def rental_params
    params.require(:rental).permit(:start, :end, :comment)
  end

    def set_chat_room
    @chat_room = current_user.chat_room
  end
end

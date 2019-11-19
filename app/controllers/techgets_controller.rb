class TechgetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:dashboard]

  def dashboard
    @users = User.all

    @geojson = []

    @users.each do |user|
      techget_list = user.techgets.map do |techget|
        { name: techget.name,
          description: techget.description,
          photo: techget.photo.url,
          url: "techgets/#{techget.id}" }
      end

      @geojson << {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [user.long, user.lat]
        },
        properties: {
          title: "#{user.name}'s devices",
          description: techget_list
        }
      }
    end

    respond_to do |format|
      format.html
      format.json { render json: @geojson } # respond with the created JSON object
    end
  end

  def index
  end

  def show
    @techget = Techget.find(params[:id])
    @rental = Rental.new
  end

  def new
    @techget = Techget.new
  end

  def create
    @techget = Techget.new(techget_params)
    @techget.user = current_user
    @techget.save
    redirect_to rentals_path
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

  def techget_params
    params.require(:techget).permit(:name, :description, :photo)
  end
end

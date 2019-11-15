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
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end
end

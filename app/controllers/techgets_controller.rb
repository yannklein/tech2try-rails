class TechgetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @users = User.all

    @geojson = Array.new

    @users.each do |user|
      techget_list = user.techgets.map do |techget|
        { name: techget.name, description: techget.description, photo: techget.photo.url}
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

  def show
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

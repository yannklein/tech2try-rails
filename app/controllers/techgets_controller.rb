class TechgetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @techgets = Techget.all
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

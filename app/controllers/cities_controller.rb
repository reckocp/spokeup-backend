class CitiesController < ApplicationController
  def index
    @cities = City.all
  end

  def show
    @city = get_city
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(name: params[:city][:name])
    @city.save!
  end

  def edit
    @city = get_city
  end

  def update
    City.update(params[:id], city_params)
  end

  def destroy
    @city = get_city
    @city.destroy
  end

private
  def get_city
    City.find(params[:id])
  end

  def city_params
    params.require(:city).permit(:name)
  end

end

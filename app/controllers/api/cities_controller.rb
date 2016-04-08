class Api::CitiesController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    render json: @cities = City.all
  end

  def show
    @city = get_city
    render json: @city
  rescue ActiveRecord::RecordNotFound
    error_not_found
  end

  def new
    render json: @city = City.new
  end

  def create
    render json: @city = City.new(name: params[:city][:name])

    @city.save!
  end

  def edit
    render json: @city
  rescue ActiveRecord::RecordNotFound
    error_not_found
  end

  def update
    @city = get_city
    @city.update(city_params)

    render json: @city
  end

  def destroy
    @city = get_city
    @city.destroy

    render json: @city.destroy

  rescue ActiveRecord::RecordNotFound
    error_not_found
  end

private
  def get_city
    @city = City.find(params[:id])
  end

  def city_params
    params.require(:city).permit(:name)
  end

  def error_not_found
    render json: { message: "Not found", status: 404 }, status: 404
  end
end

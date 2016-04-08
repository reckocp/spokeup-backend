class Api::CitiesController < ApplicationController
  protect_from_forgery with: :null_session
  respond_to :json

  def index
    respond_with @cities = City.all
  end

  def show
    @city = get_city
    respond_with @city
  rescue ActiveRecord::RecordNotFound
    error_not_found
  end

  def new
    respond_with @city = City.new
  end

  def create
    respond_with @city = City.new(name: params[:city][:name])

    @city.save!
  end

  def edit
    respond_with @city
  rescue ActiveRecord::RecordNotFound
    error_not_found
  end

  def update
    @city = get_city
    @city.update(city_params)

    respond_with @city
  end

  def destroy
    @city.destroy

    respond_with @city.destroy

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

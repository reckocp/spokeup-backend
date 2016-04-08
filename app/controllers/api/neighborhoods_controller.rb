class Api::NeighborhoodsController < ApplicationController
  protect_from_forgery with: :null_session
  respond_to :json

  def index
    respond_with @neighborhoods = Neighborhood.all
  end

  def show
    @neighborhood = get_neighborhood
    respond_with @neighborhood
  rescue ActiveRecord::RecordNotFound
    error_not_found
  end

  def new
    respond_with @neighborhood = Neighborhood.new
  end

  def create
    respond_with @neighborhood = Neighborhood.update(params[:id], neighborhood_params)

    @neighborhood.save!
  end

  def edit
    respond_with @neighborhood
  rescue ActiveRecord::RecordNotFound
    error_not_found
  end

  def update
    @neighborhood = get_neighborhood
    @neighborhood.update(neighborhood_params)

    respond_with @neighborhood
  end

  def destroy
    @neighborhood.destroy

    respond_with @neighborhood.destroy

  rescue ActiveRecord::RecordNotFound
    error_not_found
  end

private
  def get_neighborhood
    Neighborhood.find(params[:id])
  end

  def neighborhood_params
    params.require(:neighborhood).permit(:name, :description)
  end

  def error_not_found
    render json: { message: "Not found", status: 404 }, status: 404
  end
end

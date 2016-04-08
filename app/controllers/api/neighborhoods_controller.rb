class Api::NeighborhoodsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    render json: @neighborhoods = Neighborhood.all
  end

  def show
    @neighborhood = get_neighborhood
    render json: @neighborhood.to_json(include: :votes, methods: [:avg_ease, :avg_amenities, :avg_safety])
  rescue ActiveRecord::RecordNotFound
    error_not_found
  end

  def new
    render json: @neighborhood = Neighborhood.new
  end

  def create
    render json: @neighborhood = Neighborhood.update(params[:id], neighborhood_params)

    @neighborhood.save!
  end

  def edit
    render json: @neighborhood
  rescue ActiveRecord::RecordNotFound
    error_not_found
  end

  def update
    @neighborhood = get_neighborhood
    @neighborhood.update(neighborhood_params)

    render json: @neighborhood
  end

  def destroy
    @neighborhood = get_neighborhood
    @neighborhood.destroy

    render json: @neighborhood.destroy

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

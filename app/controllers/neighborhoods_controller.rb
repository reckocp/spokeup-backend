class NeighborhoodsController < ApplicationController
  def index
    @neighorhoods = Neighborhood.all
  end

  def show
    @neighborhood = get_neighborhood
  end

  def new
    @neighborhood = Neighborhood.new
  end

  def create
    @neighborhood = Neighborhood.new(name: params[:neighborhood][:name],
                                    description: params[:neighborhood][:description])
    @neighborhood.save!
  end

  def edit
    @neighborhood = get_neighborhood
  end

  def update
    Neighborhood.update(params[:id], neighborhood_params)
  end

  def destroy
    @neighborhood = get_neighborhood
    @neighborhood.destroy
  end

private
  def get_neighborhood
    Neighborhood.find(params[:id])
  end

  def neighborhood_params
    params.require(:neighborhood).permit(:name, :description)
  end

end

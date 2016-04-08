class Api::VotesController < ApplicationController
  protect_from_forgery with: :null_session
  respond_to :json

  def index
    respond_with @votes = Vote.all
  end

  def show
    @vote = get_vote
    respond_with @vote 
  rescue ActiveRecord::RecordNotFound
    error_not_found
  end

  def new
    respond_with @vote = Vote.new
  end

  def create
    respond_with @vote = Vote.new(ease: params[:vote][:ease],
                                  amenities: params[:vote][:amenities],
                                  safety: params[:vote][:safety])
  end

  def edit
    respond_with @vote
  rescue ActiveRecord::RecordNotFound
    error_not_found
  end

  def update
    @vote = get_vote
    @vote.update(vote_params)

    respond_with @vote
  end

  def destroy
    @vote.destroy

    respond_with @vote.destroy

  rescue ActiveRecord::RecordNotFound
    error_not_found
  end

private
  def get_vote
    @vote = Vote.find(params[:id])
  end

  def vote_params
    params.require(:vote).permit(:ease, :amenities, :safety)
  end

  def error_not_found
    render json: { message: "Not found", status: 404 }, status: 404
  end
end

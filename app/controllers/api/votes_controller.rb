class Api::VotesController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    render json: @votes = Vote.all
  end

  def show
    @vote = get_vote
    render json: @vote
  rescue ActiveRecord::RecordNotFound
    error_not_found
  end

  def new
    render json: @vote = Vote.new
  end

  def create
    render json: @vote = Vote.new(ease: params[:vote][:ease],
                                  amenities: params[:vote][:amenities],
                                  safety: params[:vote][:safety])
  end

  def edit
    render json: @vote
  rescue ActiveRecord::RecordNotFound
    error_not_found
  end

  def update
    @vote = get_vote
    @vote.update(vote_params)

    render json: @vote
  end

  def destroy
    @vote = get_vote
    @vote.destroy

    render json: @vote.destroy

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

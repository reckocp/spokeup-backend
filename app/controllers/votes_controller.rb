class VotesController < ApplicationController
  def index
    @votes = Vote.all
  end

  def show
    @vote = get_vote
  end

  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new(ease: params[:vote][:easy],
                      amenities: params[:vote][:amenities],
                      safety: params[:vote][:safety])
    @vote.save!
  end

  def edit
    @vote = get_vote
  end

  def update
    Vote.update(params[:id], vote_params)
  end

  def destroy
    @vote = get_vote
    @vote.destroy
  end

private
  def get_vote
    Vote.find(params[:id])
  end

  def vote_params
    params.require(:vote).permit(:ease, :amenities, :safety)
  end
end

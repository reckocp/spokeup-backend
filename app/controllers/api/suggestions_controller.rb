class Api::SuggestionsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    render json: @suggestions = Suggestion.all
  end

  def show
    @suggestion = get_suggestion
    render json:  @suggestion
  rescue ActiveRecord::RecordNotFound
    error_not_found
  end

  def new
    render json:  @suggestion = Suggestion.new
  end

  def create
    render json: @suggestion = Suggestion.new(name: params[:suggestion][:name],
                                  body: params[:suggestion][:body])

    @suggestion.save!
  end

  def edit
    render json: @suggestion
  rescue ActiveRecord::RecordNotFound
    error_not_found
  end

  def update
    @suggestion = get_suggestion
    @suggestion.update(suggestion_params)

    render json: @suggestion
  end

  def destroy
    @suggestion = get_suggestion
    @suggestion.destroy

    render json: @suggestion.destroy

  rescue ActiveRecord::RecordNotFound
    error_not_found
  end

private
  def get_suggestion
    Suggestion.find(params[:id])
  end

  def suggestion_params
    params.require(:suggestion).permit(:name, :body)
  end

  def error_not_found
    render json: { message: "Not found", status: 404 }, status: 404
  end
end

class SuggestionsController < ApplicationController
  def index
    @suggestions = Suggestion.all
  end

  def show
    @suggestion = get_suggestion
  end

  def new
    @suggestion = Suggestion.new
  end

  def create
    @suggestion = Suggestion.new(name: params[:suggestion][:name],
                                    body: params[:suggestion][:body])
    @suggestion.save!
  end

  def edit
    @suggestion = get_suggestion
  end

  def update
    Suggestion.update(params[:id], suggestion_params)
  end

  def destroy
    @suggestion = get_suggestion
    @suggestion.destroy
  end

private
  def get_suggestion
    Suggestion.find(params[:id])
  end

  def suggestion_params
    params.require(:suggestion).permit(:name, :body)
  end

end

class Api::UsersController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    render json: @users = User.all
  end

  def show
    @user = get_user
    render json:  @user
  rescue ActiveRecord::RecordNotFound
    error_not_found
  end

  def new
    render json:  @user = User.new
  end

  def create
    render json: @user = User.new(name: params[:user][:name],
                                  age: params[:user][:age])

    @user.save!
  end

  def edit
    render json: @user
  rescue ActiveRecord::RecordNotFound
    error_not_found
  end

  def update
    @user = get_user
    @user.update(user_params)

    render json: @user
  end

  def destroy
    @user = get_user
    @user.destroy

    render json: @user.destroy

  rescue ActiveRecord::RecordNotFound
    error_not_found
  end

private
  def get_user
    User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name)
  end

  def error_not_found
    render json: { message: "Not found", status: 404 }, status: 404
  end
end

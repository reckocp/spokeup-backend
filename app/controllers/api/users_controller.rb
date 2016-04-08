class Api::UsersController < ApplicationController
  protect_from_forgery with: :null_session
  respond_to :json

  def index
    respond_with @users = User.all
  end

  def show
    @user = get_user
    respond_with @user
  rescue ActiveRecord::RecordNotFound
    error_not_found
  end

  def new
    respond_with @user = User.new
  end

  def create
    respond_with @user = User.new(name: params[:user][:name],
                                  age: params[:user][:age])

    @user.save!
  end

  def edit
    respond_with @user
  rescue ActiveRecord::RecordNotFound
    error_not_found
  end

  def update
    @user = get_user
    @user.update(user_params)

    respond_with @user
  end

  def destroy
    @user.destroy

    respond_with @user.destroy

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

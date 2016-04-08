class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = get_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(name: params[:user][:name],
                      age: params[:user][:age])
    @user.save!
  end

  def edit
    @user = get_user
  end

  def update
    User.update(params[:id], user_params)
  end

  def destroy
    @user = get_user
    @user.destroy
  end

private
  def get_user
    User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name)
  end
end

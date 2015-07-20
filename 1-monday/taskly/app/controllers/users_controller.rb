class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def create
    user = User.new(user_params)
    if user.valid?
      user.save
      render json: user
    else
      render status: 400, json: user.errors
    end
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end

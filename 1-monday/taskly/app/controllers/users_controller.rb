class UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    render json: User.all
  end

  def create
    user = User.new(user_params)
    if user.valid?
      user.save
      render status: 201, json: user
    else
      render status: 400, json: user.errors
    end
  end

  def show
    user = User.find(params[:id])
    unless user
      render status: 404, json: {error: "user not found"}
      return
    end
    render json: user
  end

  def update
    user = User.find(params[:id])
    user.assign_attributes(user_params)
    if user.valid?
      user.save
      render json: user
    else
      render status: 400, json: user.errors
    end
  end

  def destroy
    user = User.find(params[:id])
    unless user
      render status: 404, json: {error: "user not found"}
      return
    end
    user.destroy
    render status: 204, json: {status: "Deleted"}
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end

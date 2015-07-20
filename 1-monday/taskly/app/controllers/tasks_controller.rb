class TasksController < ApplicationController
  before_filter :find_user, only: [:index, :create, :show, :update, :destroy]

  def index
    render json: @user.tasks
  end

  def create
    task = Task.new(task_params.merge({user_id: params[:user_id]}))
    if task.valid?
      task.save
      render status: 201, json: task
      return
    end
    render status: 400, json: task.errors
  end

  def show
    task = @user.tasks.find(params[:id])
    unless task
      render status: 404, json: {error: "task not found"}
      return
    end
    render json: task
  end

  def update
    task = Task.find(params[:id])
    task.assign_attributes(task_params)
    if task.valid?
      task.save
      render status: 201, json: task
      return
    end
    render status: 400, json: task.errors
  end

  def destroy
    task = Task.find(params[:id])
    unless task
      render status: 404, json: {error: "task not found"}
      return
    end
    task.destroy
    render status: 204, json: {status: "Deleted"}
  end

  private

  def task_params
    params.require(:task).permit(:description, :completed_timestamp)
  end

  def find_user
    @user = User.find_by(id: params[:user_id])
    unless @user
      render status: 404, json: {error: "user not found"}
      return
    end
  end
end

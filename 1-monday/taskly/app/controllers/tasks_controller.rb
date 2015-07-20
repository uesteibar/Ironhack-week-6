class TasksController < ApplicationController
  def index
    user = User.find_by(id: params[:user_id].to_i)
    unless user
      render status: 404, json: {error: "user not found"}
      return
    end
    render json: user.tasks
  end

  def create
    user = User.find_by(id: params[:user_id].to_i)
    unless user
      render status: 404, json: {error: "user not found"}
      return
    end

    task = user.tasks.new(task_params)
    if task.valid?
      task.save
      render status: 201, json: task
      return
    end
    render status: 400, json: task.errors
  end

  def show
    task = Task.find(params[:id])
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
end

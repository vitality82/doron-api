class Api::V1::TasksController < ApplicationController

  # render all items in Task
  def index
    tasks = Task.all
    render json: tasks, status: 200
  end

  def show
    render json: {
      msg: 'hello'
    }, status: 200
  end

  def create
    task = Task.new(task_params)
    if task.save
      render json: task, status: :created
    else
      render json: { error: task.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    task = Task.find(params[:id])

    if task.update(task_params)
      render json: task, status: :ok
    else
      render json: { errors: task.errors }, status: :unprocessable_entity
    end
  end

  private def task_params
    params.require(:task).permit(:name)
  end

end

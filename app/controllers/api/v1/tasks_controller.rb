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
    task = Task.new(task_params_name)
    if task.save
      render json: task, status: :created
    else
      render json: { error: task.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy

    render json: { message: 'Task deleted successfully' }, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Task not found' }, status: :not_found
  end

  def update_name
    task = Task.find(params[:id])

    if task.update(task_params_name)
      task.touch(:updated_at)
      render json: task, status: :ok
    else
      render json: { error: 'Failed to update task name' }, status: :unprocessable_entity
    end
  end

  def update_date_completed
    task = Task.find(params[:id])
    task.update(date_completed: completed_param ? Time.now : nil)

    if task.errors.empty?
      task.touch(:updated_at)
      render json: task, status: :ok
    else
      render json: { error: 'Failed to update task date completed' }, status: :unprocessable_entity
    end
  end



  private

  def task_params_name
    params.require(:task).permit(:name)
  end

  def completed_param
    params[:is_completed] == true
  end

end

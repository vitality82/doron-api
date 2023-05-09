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
end

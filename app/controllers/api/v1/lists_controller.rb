class Api::V1::ListsController < ApplicationController
  def index
    lists = List.all
    render json: lists, status: 200
  end

  def show
    render json: {
      msg: 'hello'
    }, status: 200
  end
end

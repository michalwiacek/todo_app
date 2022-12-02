# frozen_string_literal: true

class Api::TodoListsController < ApplicationController
  wrap_parameters :todo_list
  before_action :load_todo_list, only: %i[show update destroy]

  def index
    @todo_lists = TodoList.all
    json = Panko::ArraySerializer.new(@todo_lists, each_serializer: TodoListSerializer).to_json
    render json:
  end

  def show
    render json: serialize(@todo_list)
  end

  def create
    @todo_list = TodoList.new(todo_list_params)
    if @todo_list.save
      render json: serialize(@todo_list)
    else
      head :unprocessable_entity
    end
  end

  def update
    if @todo_list.update(todo_list_params)
      render json: serialize(@todo_list)
    else
      head :unprocessable_entity
    end
  end

  def destroy
    if @todo_list.destroy
      head :ok
    else
      head :unprocessable_entity
    end
  end

  private

  def load_todo_list
    @todo_list = TodoList.find(params[:id])
  end

  def todo_list_params
    params.require(:todo_list).permit(:title)
  end

  def serialize(todo_list)
    TodoListSerializer.new.serialize_to_json(todo_list)
  end
end

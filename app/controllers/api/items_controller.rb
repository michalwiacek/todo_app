# frozen_string_literal: true

class Api::ItemsController < ApplicationController
  wrap_parameters :item
  before_action :load_todo_list
  before_action :load_item, only: %i[update destroy]

  def index
    @items = @todo_list.items
    json = Panko::ArraySerializer.new(@items, each_serializer: ItemSerializer).to_json
    render json:
  end

  def create
    @item = @todo_list.items.build(item_params)
    if @item.save
      render json: serialize(@item)
    else
      head :unprocessable_entity
    end
  end

  def update
    if @item.update(item_params)
      render json: serialize(@item)
    else
      head :unprocessable_entity
    end
  end

  def destroy
    if @item.destroy
      head :ok
    else
      head :unprocessable_entity
    end
  end

  private

  def load_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  def load_item
    @item = @todo_list.items.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:description, :checked)
  end

  def serialize(item)
    ItemSerializer.new.serialize_to_json(item)
  end
end

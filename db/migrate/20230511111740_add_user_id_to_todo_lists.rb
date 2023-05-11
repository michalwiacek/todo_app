# frozen_string_literal: true

class AddUserIdToTodoLists < ActiveRecord::Migration[7.0]
  def change
    add_reference :todo_lists, :user, null: false, foreign_key: true
  end
end

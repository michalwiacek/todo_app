# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :todo_list, null: false, foreign_key: true
      t.text :description
      t.boolean :checked, null: false, default: false

      t.timestamps
    end
  end
end

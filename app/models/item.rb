# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :todo_list
end

# frozen_string_literal: true

class TodoList < ApplicationRecord
  has_many :items, dependent: :delete_all

  validates :title, presence: true

  belongs_to :user
end

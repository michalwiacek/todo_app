# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :todo_lists, dependent: :delete_all
end

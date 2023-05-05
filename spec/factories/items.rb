# frozen_string_literal: true

FactoryBot.define do
  factory :item do
    todo_list
    description { |i| "Item #{i}" }
  end
end

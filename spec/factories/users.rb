# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { "example@nekosof.pl" }
    password_digest { "MyString" }
  end
end

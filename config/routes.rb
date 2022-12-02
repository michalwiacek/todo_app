# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    resources :todo_lists, only: %i[index show create update destroy]
  end

  # root "articles#index"
end

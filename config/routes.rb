# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    resources :todo_lists, only: %i[index show create update destroy] do
      resources :items, only: %i[index create update destroy]
    end
  end

  root "home#index"
end

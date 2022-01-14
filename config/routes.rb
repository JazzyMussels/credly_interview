# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'static_pages#home'

  resources :badges, only: [:index]
  resources :characters, only: [:index, :show]
  post '/characters/:id/add_badge', to: 'characters#add_badge_to_character', as: :add_badge_to_character
end

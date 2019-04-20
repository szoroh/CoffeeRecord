# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'coffees#index'
  resources :coffees
end

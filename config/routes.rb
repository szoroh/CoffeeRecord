# frozen_string_literal: true

Rails.application.routes.draw do
  # authenticated do
  #   root 'coffee#index'
  # end

  root 'pages#welcome'

  devise_for :users
  resources :coffees
end

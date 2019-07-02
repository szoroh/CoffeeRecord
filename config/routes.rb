# frozen_string_literal: true

Rails.application.routes.draw do
  authenticated do
    root 'coffees#index'
  end

  root 'pages#welcome'

  devise_for :users,
    controllers:  { registrations:  'registrations' }

  resources :coffees do
    resources :recipes
  end
end

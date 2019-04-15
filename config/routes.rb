# frozen_string_literal: true

Rails.application.routes.draw do
  resources :coffees, only: [:index, :new, :create, :show]
end

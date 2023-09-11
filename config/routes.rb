# frozen_string_literal: true

Rails.application.routes.draw do
  root 'estimates#index'
  resources :estimates do
    patch 'validate', to: 'estimates#validate', on: :member

    resources :items
  end
end

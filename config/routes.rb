# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  #devise_for :users
  resources :products
  post 'add_product', to: 'invoices#add_product'
  resources :invoices, only: :show
end

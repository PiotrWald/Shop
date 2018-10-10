# frozen_string_literal: true

Rails.application.routes.draw do
  root 'products#index'
  devise_for :users

  resources :products
  resources :invoices, only: %i[show index]
  resources :tags, only: :show
  resources :comments, only: :create

  post 'add_product', to: 'invoices#add_product'
  delete 'subtract_product/:id', to: 'invoices#remove_invoice_product'
  get 'close_invoice', to: 'invoices#close_invoice'
end

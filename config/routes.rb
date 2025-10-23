Rails.application.routes.draw do
  resources :products
  resources :cart_items, only: [:new, :create, :destroy]
  resources :carts, only: [:show]
  get 'top/main'
  
  # root 'top#main'
  root 'products#index'

end

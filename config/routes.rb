Rails.application.routes.draw do
  
  
  resources :pages, only: [:show]
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :tags, only: [:show]
  resources :categories, only: [:show]
  resources :products, only: [:index, :show]
  get 'cart' => 'products#cart', as: 'cart'
  post 'cart/:id' => 'products#add_to_cart', as: 'add_to_cart'
  post 'cart_delete/:id' => 'products#delete_from_cart', as: 'delete_from_cart'
  
  root to: "products#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

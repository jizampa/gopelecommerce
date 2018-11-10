Rails.application.routes.draw do
  
  
  resources :pages, only: [:show]
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :tags, only: [:show]
  resources :categories, only: [:show]
  resources :products, only: [:index, :show]

  root to: "products#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  get 'categories/show'
  get 'products/index'
  get 'products/show'
  # devise_for :users
  # root 'pages#home'

  root to: 'products#index'

  resources :products, only: [:index, :show]
  resources :categories, only: [:show]
  
end

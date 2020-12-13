Rails.application.routes.draw do
 
  devise_for :users
  # root 'pages#home'

  root to: 'products#index'

  resources :products
  resources :categories
  
end

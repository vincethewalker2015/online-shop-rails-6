Rails.application.routes.draw do
 
  devise_for :users
  # root 'pages#home'

  root to: 'products#index'

  resources :products
  resources :categories
  #resources :categories, only: [:show]
  resource :cart, only: [:show] do
    put 'add/:product_id', to: 'carts#add', as: :add_to
    put 'remove/:product_id', to: 'carts#remove', as: :remove_from
    put 'remove_one/:product_id', to: 'carts#removeone', as: :remove_one
  end
  
  
end

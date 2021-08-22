Rails.application.routes.draw do
 
  get 'sales/index'
  get 'sales/show'
  devise_for :users
  root 'pages#home'
  # root :to => 'products#index'
  

  resources :users do 
    resource :profile
    resources :orders, only: [:index, :show]
    resources :users, only: [:show, :index]
  end
  # resources :users, only: [:show, :index]
  resources :profiles, only: [:index, :show]
  resources :products
  get 'my_products', to: 'products#my_products' 
  get 'search_product', to: 'products#search'
  resources :categories
  resources :orders
  #resources :categories, only: [:show]
  resource :cart, only: [:show] do
    put 'add/:product_id', to: 'carts#add', as: :add_to
    put 'remove/:product_id', to: 'carts#remove', as: :remove_from
    put 'remove_one/:product_id', to: 'carts#removeone', as: :remove_one
  end
  resources :transactions, only: [:new, :create]
  
end

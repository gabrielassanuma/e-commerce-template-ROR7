Rails.application.routes.draw do
  devise_for :users
  
  root "products#index"
  resources :products, except: [:destroy]
  get 'admin_products_index', to: 'products#admin_products_index', as: 'admin_products_index'
  get 'about', to: 'pages#about', as: 'about'
  get 'admin_dashboard', to: 'pages#admin_dashboard', as: 'admin_dashboard'
  resources :categories, except: [:destroy] do
    patch :deactive, on: :member
    patch :move, on: :member
  end
  resources :discounts, except: [:destroy] do
    patch :deactive, on: :member
  end
end

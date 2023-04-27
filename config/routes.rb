Rails.application.routes.draw do
  devise_for :users
  
  root "products#index"
  resources :products, except: [:destroy]
  get 'about', to: 'pages#about', as: 'about'
  get 'admin_dashboard', to: 'pages#admin_dashboard', as: 'admin_dashboard'
  resources :categories, except: [:destroy] do
    patch :deactive, on: :member
  end
  resources :discounts, except: [:destroy] do
    patch :deactive, on: :member
  end
end

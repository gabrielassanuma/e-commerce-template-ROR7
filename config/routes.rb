Rails.application.routes.draw do
  devise_for :users
  get 'about', to: 'pages#about', as: 'about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "products#index"
  resources :products, except: [:destroy]
end

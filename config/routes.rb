Rails.application.routes.draw do
  devise_for :users
  
  root "products#index"
  resources :products, except: [:destroy]
  get 'about', to: 'pages#about', as: 'about'

end

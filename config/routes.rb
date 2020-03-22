Rails.application.routes.draw do
 
 root to: 'pages#home'
  get 'pages/about'
  get 'login', to: 'sessions#login'
  post 'login', to:"sessions#create"
  delete 'logout', to: 'sessions#destroy'
  resources :articles
  resources :users
  resources :categories, except: [:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  
  root to: "tasks#index"
  resources :tasks
  
  resources :users, only:[:index, :new, :create]
  
  get "login" ,to: "sessions#new"
  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'
  
end

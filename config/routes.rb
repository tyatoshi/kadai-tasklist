Rails.application.routes.draw do
  
  root to: "tasks#index"
  resources :tasks
  
  resources :users
  
  get "login" ,to: "sessions#new"
  post 'login', to: 'sessions#create'
  
end

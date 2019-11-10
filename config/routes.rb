Rails.application.routes.draw do
  root 'users#new'
  resources :shifts
  resources :users
  resources :organisations
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  root 'users#new'
  resources :shifts
  resources :users
  resources :organisations
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  patch '/switch_organisation', to: 'users#switch_organisation'
  post '/shifts', to: 'shifts#create'
  # post '/create', to: 'organisations#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

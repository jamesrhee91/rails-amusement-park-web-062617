Rails.application.routes.draw do

  root to: 'static#index'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'


  resources :rides

  resources :attractions

  resources :users

end

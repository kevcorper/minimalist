Rails.application.routes.draw do
  root 'snippets#index'

  resources :users, except: [:index]
  resources :snippets
  resources :sessions, only: [:new, :create, :destroy]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end

Rails.application.routes.draw do
  root 'snippets#index'

  resources :users, except: [:index] do
  	resources :snippets, only: [:new, :create] do
      resources :comments, except: [:index, :show]
    end
  end

  resources :snippets, except: [:new, :create] do
  	resources :iframes, only: [:index]
	end

  resources :categories, only: [:show]

  resources :about, only: [:index]

  resources :sessions, only: [:new, :create, :destroy]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end

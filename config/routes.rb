Rails.application.routes.draw do
  root 'snippets#index'

  resources :users, except: [:index] do
    resources :colors, only: [:new, :create, :destroy]
  	resources :snippets, except: [:index, :show] do
      resources :comments, except: [:index, :show]
      resources :favorites, only: [:create, :destroy]
    end
  end

  resources :snippets, only: [:show, :index] do
  	resources :iframes, only: [:index]
	end

  resources :categories, only: [:show]

  resources :sessions, only: [:new, :create, :destroy]

  resources :colors, only: [:index]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/about' => 'welcome#about'
end

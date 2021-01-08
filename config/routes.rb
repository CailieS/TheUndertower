Rails.application.routes.draw do
  root to: 'application#home'
  
  
  resources :users, except:[:destroy, :create, :new, :update] do
    resources :books, only: [:new, :create, :index]
  end
  resources :reviews
  resources :books do
    resources :reviews, only: [:new, :create, :index]
  end
  resources :users

  get '/books', to: 'books#index'
  get '/books/:id', to: 'books#show'

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#delete'

  get '/auth/facebook/callback', to: 'sessions#login_with_fb'
  post '/logout', to: 'sessions#destroy'

end

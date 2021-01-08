Rails.application.routes.draw do
  root to: 'sessions#home'
  
  
  resources :reviews
  resources :books do
    resources :reviews, only: [:new, :create, :index]
  end
  resources :users
  resources :books

  get '/books', to: 'books#index'
  get '/books/:id', to: 'books#show'

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  

  get '/auth/facebook/callback', to: 'sessions#login_with_fb'
  post '/logout', to: 'sessions#destroy'

end

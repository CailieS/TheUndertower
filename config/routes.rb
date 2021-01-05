Rails.application.routes.draw do
  root to: 'sessions#home'
  
  resources :books, except:[:destroy, :create, :new, :update] do
    resources :reviews
  end
  resources :reviews
  resources :books
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

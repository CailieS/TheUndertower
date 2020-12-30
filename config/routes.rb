Rails.application.routes.draw do
  root to: 'application#home'
  
  resources :books
  resources :reviews
  resources :users, except:[:new]
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy'
  get '/reviews', to: 'reviews#index'
  get '/reviews/new', to: 'reviews#new'
  post '/reviews', to: 'reviews#create'
  get '/reviews/:id', to: 'reviews#show', as: 'reviews_show'
 
end

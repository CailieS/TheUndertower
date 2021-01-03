Rails.application.routes.draw do
  root to: 'application#home'
  
  resources :books, except:[:destroy, :create, :new, :update] do
    resources :reviews
  end
  resources :reviews
  
  resources :users, except:[:new]

  get '/books', to: 'books#index'
  get '/books/:id', to: 'books#show', as: 'bookid'

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#delete'

    get '/auth/facebook/callback', to: 'sessions#login_with_fb'
  #  get '/reviews', to: 'reviews#index'
  #  post '/reviews', to: 'reviews#create'
  #  get '/reviews/new', to: 'reviews#new'
  #  get '/reviews/:id/edit', to: 'reviews#edit', as: 'review'
  # get '/reviews/:id', to: 'reviews#show', as: 'reviews_show'
  # patch 'reviews/:id', to: 'reviews#update'
  # #delete 'reviews/:id/delete', to 'reviews#destroy'
  
end

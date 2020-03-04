Rails.application.routes.draw do
  resources :votes
  resources :posts, only: [:index, :new, :show, :create, :edit, :update]
  resources :topics, only: [:index, :show]
  resources :users, only: [:show, :new, :create, :edit, :update]
  resources :comments, only: [:create]

  get '/', to: 'posts#index', as: 'home'
  get '/users/:id/feed', to: 'users#feed', as: 'user_feed'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  delete '/sessions', to: 'sessions#destroy'

  put '/comments/:id/upvote_comment', to: 'votes#upvote_comment', as: 'upvote_comment'
  put '/posts/:id/upvote_post', to: 'votes#upvote_post', as: 'upvote_post'
  
end

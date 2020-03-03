Rails.application.routes.draw do
  resources :posts, only: [:index, :new, :show, :create, :edit, :update]
  resources :topics, only: [:index, :show]
  resources :users, only: [:show, :new, :create, :edit, :update]
  resources :comments, only: [:create]

  get '/users/:id/feed', to: 'users#feed', as: 'user_feed'
  get '/', to: 'posts#index', as: 'home'
  put '/comments/:id/upvote_comment', to: 'comments#upvote_comment', as: 'upvote_comment'
  put '/posts/:id/upvote_post', to: 'posts#upvote_post', as: 'upvote_post'

end

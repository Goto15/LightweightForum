Rails.application.routes.draw do
  resources :posts, only: [:index, :new, :show, :create, :edit, :update]
  resources :topics, only: [:index, :show]
  resources :users, only: [:show, :new, :edit, :update]

  get '/users/:id/feed', to: 'users#feed', as: 'user_feed'
end

Rails.application.routes.draw do
  resources :posts, only: [:index, :new, :show]
  resources :topics, only: [:index, :show]
  resources :users, only: [:show, :new, :edit]
end

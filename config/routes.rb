Rails.application.routes.draw do
  devise_for :users
  resources :users,only: [:show]
  resources :images
  resources :events
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'posts#index'
end

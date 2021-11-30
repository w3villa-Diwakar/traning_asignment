Rails.application.routes.draw do
  
  namespace :admin do
    resources :tags
  end
  resources :comments do
  	collection do
  		get 'recent'
  	end
  end
  devise_for :users
  resources :users,only: [:show]
  resources :images
  resources :events
  resources :posts do
  	member do
  		get 'comments'
  	end
  end
  
  root 'posts#index'
  namespace :admin do
    #root 'dashboards#index'
    root "dashboards#posts"
    get "events/", to: "dashboards#events"
    get "images/", to: "dashboards#images"
    resources :users
    resources :categorizes
    resources :categories

  end
  get '/404', to: 'errors#not_found'
  get '/500', to: 'errors#internal_server'
  get '/422', to: 'errors#unprocessable'
end

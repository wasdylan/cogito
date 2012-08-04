Higherthought::Application.routes.draw do

  get "home/stream"

  get "feedback/index"

  resources :posts do
    resources :comments
    resources :agrees
  end

  resources :posts

	resources :users do
    resources :relationships
  end

  match 'user/:id' => 'users#profile'

  authenticated :user do
    root :to => 'home#stream'
  end
  root :to => "home#index"
  devise_for :users
  resources :users, :only => [:show, :index]


end

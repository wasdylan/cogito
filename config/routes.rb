Higherthought::Application.routes.draw do
  resources :comments

  resources :agrees

  resources :posts

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users, :only => [:show, :index]
end

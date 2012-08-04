Higherthought::Application.routes.draw do

  get "home/stream"

  get "feedback/index"

  resources :posts do
    resources :comments
    resources :agrees
  end

  resources :posts


  match 'user/:id' => 'users#profile'

  authenticated :user do
    root :to => 'home#stream'
  end
  root :to => "home#index"
  devise_for :users

  resources :users, :only => [:show, :index] do
		resources :relationships
	end


end

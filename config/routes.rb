Rails.application.routes.draw do
  #get 'relationships/create'
  #get 'relationships/destroy'
	devise_for :users
	resources :users, only: [:show, :index, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
	end
	resources :posts do
		resource :favorites, only: [:create, :destroy]
		resources :post_comments, only: [:create, :destroy]
	end
	resources :forums, only: [:index, :create, :destroy] do
	end
	get 'posts/new'
	root 'posts#top'
	get 'posts/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

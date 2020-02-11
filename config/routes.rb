Rails.application.routes.draw do
  get 'home/top'
  get 'home/about'
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
	resources :forums, only: [:index, :show, :edit, :create, :update, :destroy] do
    resources :forum_replies, only: [:create, :destroy]
    resource :forum_favorites, only:[:create, :destroy]
	end
  root 'home#top'
  get 'home/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#home'
  get  'posts/search'
  resources :users,only: [:show, :edit, :update, :index] do
    member do
          get :following, :followers
      end
  end
  resources :posts, only: [:new, :index, :show, :edit, :create, :update, :destroy] do
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
    resource :books, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
end

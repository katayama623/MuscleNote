Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#home'
  resources :users,only: [:show, :edit, :update, :index]
  resources :posts, only: [:index, :show, :edit, :create, :update, :destroy] do
    resource :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
    resource :books, only: [:create, :destroy]
  end
end

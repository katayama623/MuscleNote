Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#home'
  get  'posts/search'
  get 'search2' => 'posts#search2'
  get  'posts/part0'
  get  'posts/part1'
  get  'posts/part2'
  get  'posts/part3'
  get  'posts/part4'
  get  'posts/part5'
  get  'posts/part6'
  get  'posts/part7'
  get  'posts/part8'
  get  'posts/strong0'
  get  'posts/strong1'
  get  'posts/strong2'
  get 'users/:id/bookmark' => 'users#bookmark', as: 'users_bookmark'
  resources :users do
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

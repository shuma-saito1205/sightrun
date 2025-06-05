Rails.application.routes.draw do
  get 'new/index'
  root to: 'homes#top'
  get 'homes/about' => 'homes#about', as: 'about'
  get "search" => "searches#search"
  devise_for :users
  resources :posts do
    resources :post_comments, only: [:new, :create, :index, :destroy]
  end
  resources :users, only: [:show, :edit, :index, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

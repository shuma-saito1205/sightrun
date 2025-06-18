Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    get '/' => 'homes#top'
    resources :users, only: [:show, :destroy]
    resources :post_comments, only: [:index, :destroy]
    resources :events, only: [:new, :index, :create]
    get '/events', to: 'events#index', defaults: { format: 'json' }
  end

  get 'new/index'
  root to: 'homes#top'
  get 'homes/about' => 'homes#about', as: 'about'
  get "search" => "searches#search"
  devise_for :users
  resources :events, only: [:index]
  get '/events', to: 'events#index', defaults: { format: 'json' }
  resources :users, only: [:show, :edit, :index, :update, :destroy]
  resources :activities, only: [:new, :create, :index, :edit, :update, :destroy]
  resources :posts do
    resources :post_comments, only: [:new, :create, :index, :destroy]
  end
  resources :groups do
    resources :permits, only: [:create, :destroy]
    resource :group_users, only: [:create, :destroy]
  end
  get "groups/:id/permits" => "groups#permits", as: :permits
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    get '/' => 'homes#top'
    resources :users, only: [:show, :destroy]
    resources :post_comments, only: [:index, :destroy]
    resources :events, only: [:new, :create, :index, :destroy]
  end

  root to: 'homes#top'
  get "search" => "searches#search"
  devise_for :users
  get '/events', to: 'events#index'
  get 'events/:id', to: 'events#show'
  get 'event', to: 'events#index', defaults: { format: 'json' }
  resources :users, only: [:show, :edit, :index, :update, :destroy] do
    resources :roots, only: [:new, :show, :index, :edit, :create], shallow: true
    resources :activities, only: [:new, :create, :index, :edit, :update, :destroy]
  end
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


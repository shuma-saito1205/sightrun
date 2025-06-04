Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  } #adminのdeviseは新規登録とパスワード機能を無効。admin/sign_imで管理者ログイン。
  root to: 'homes#top'
  get 'homes/about' => 'homes#about', as: 'about'
  devise_for :users
  resources :posts
  resources :users, only: [:show, :edit, :index, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

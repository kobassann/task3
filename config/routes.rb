Rails.application.routes.draw do

  devise_for :users
  root to: "homes#top"
  get '/home/about' => 'homes#about'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books, only: [:new, :create, :edit, :index, :update, :show, :destroy] do
end

  resources :users, only: [:show, :index, :edit, :update]
end
Rails.application.routes.draw do
  root 'expenses#index'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :expenses, only: [:index, :create, :update, :destroy]
  resources :users, only: [:create, :update]
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end

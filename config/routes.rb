Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  devise_for :users

  root to: 'pages#home'

  resources :users, only: [:index, :show, :update] do
    resources :projects, only: [:index, :show]
    resources :status_apps, only: [:update, :new, :create]
  end

  resources :organizations, only: [:new, :create, :index, :show, :update] do
    resources :projects, only: [:index, :show, :new, :create, :update]
    resources :status_apps, only: [:index, :show, :update]
  end

  resources :projects, only: [:new, :create, :index, :show] # remove new and create later
end
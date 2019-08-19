Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  devise_for :users

  root to: 'pages#home'

  resources :users, only: [:index, :show, :update] do
    resources :projects, only: [:index, :show]
    resources :applications, only: [:update, :new, :create]
  end

  resources :organizations, only: [:index, :show, :update] do
    resources :projects, only: [:index, :show, :new, :create, :update]
    resources :applications, only: [:index, :show, :update]
  end

  resources :projects, only: [:index, :show]
end

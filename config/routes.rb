Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  devise_for :users

  root to: 'pages#home'

  resources :users, only: [:index, :show, :update] do
    resources :projects, only: [:index, :show]
    resources :engagements, only: [:update, :new, :create]
  end

  resources :organizations, only: [:new, :create, :index, :show, :update] do
    resources :projects, only: [:index, :show, :new, :create, :update]
    resources :engagements, only: [:index, :show, :update]
  end

  resources :projects, only: [:new, :create, :index, :show] do
    resources :engagements, only: [:update, :new, :create]
  end

end

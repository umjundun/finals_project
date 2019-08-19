Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  devise_for :users

  root to: 'pages#home'

<<<<<<< HEAD
  resources :user, only: [:index, :show, :update] do
    resources :project, only: [:index, :show]
    resources :application, only: [:update, :new, :create]
  end

  resources :organization, only: [:index, :show, :update] do
    resources :project, only: [:index, :show, :new, :create, :update]
    resources :application, only: [:index, :show, :update]
  end

  resources :projects, only: [:index, :show]
=======
  resources :users, only: [:index, :show, :update] do
    resources :projects, only: [:index, :show]
    resources :engagements, only: [:update, :new, :create]
  end

  resources :organizations, only: [:new, :create, :index, :show, :update] do
    resources :projects, only: [:index, :show, :new, :create, :update]
    resources :engagements, only: [:index, :show, :update]
  end

  resources :projects, only: [:new, :create, :index, :show] # remove new and create later
>>>>>>> master
end

Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  devise_for :users, :controllers => { registrations: 'registrations' }

  root to: 'pages#home'

  resources :users, only: [:index, :show, :update] do
    member do
      get 'projects'
    end
    resources :projects, only: [:show]
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

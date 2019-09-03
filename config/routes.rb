Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  get 'users/index'
  get 'users/show'
  devise_for :users, :controllers => { registrations: 'registrations' }

  devise_scope :user do
  get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # LANDING PAGE / USER HOME
  root to: 'pages#home'

  # SEARCH FEATURE
  get "home", to: "pages#home", as: "search"


  resources :users, only: [:index, :show, :update] do
    member do
      get 'projects'
    end
    resources :projects, only: [:show, :edit, :update]
    resources :engagements, only: [:show, :index, :update, :new, :create, :edit, :update]
  end

  resources :organizations, only: [:new, :create, :index, :show, :update] do
    resources :projects, only: [:index, :show, :new, :create, :update]
    resources :engagements, only: [:index, :show, :update]
  end

  resources :projects, only: [:new, :create, :index, :show, :update] do
    resources :engagements, only: [:update, :new, :create]
  end

  resources :conversations do
    resources :messages
  end

  resources :notifications, only: [:index] do
    collection do
      post :mark_as_read
    end
  end
end

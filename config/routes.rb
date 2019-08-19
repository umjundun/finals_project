Rails.application.routes.draw do
  # devise_for :users
  root to: 'pages#home'

#   resources :user, only: [:index, :show, :update] do
#     resources :project, only: [:index, :show]
#     resources :application, only: [:update, :new, :create]
#   end

#   resources :organization, only: [:index, :show, :update] do
#     resources :project, only: [:index, :show, :new, :create, :update]
#     resources :application, only: [:index, :show, :update]
#   end

#   resources :projects, only: [:index, :show]
end

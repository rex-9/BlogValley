Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  devise_for :users
  root 'users#index'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end

  resources :posts, only: [:new, :create, :destroy, :edit, :update] do
    resources :comments, only: [:create]
    resources :likes, only: [:create]
  end

  resources :comments, only: [:destroy]
  resources :likes, only: [:destroy]

  namespace :api, defaults: { format: :json } do
    post '/auth/login', to: 'authentication#login'
    resources :posts, only: [:index] do
      resources :comments, only: [:index, :create]
    end
  end
end

Rails.application.routes.draw do
  root 'dashboard#index'
  resources :likeds
  resources :comments
  resources :posts
  resources :community_participants
  resources :communities
  get 'dashboard', to: 'dashboard#index', as: 'dashboard'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

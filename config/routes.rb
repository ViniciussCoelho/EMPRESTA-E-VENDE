Rails.application.routes.draw do
  resources :communities do
    resources :posts do
      resource :likeds
      resources :comments
    end
    resources :community_participants
  end
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

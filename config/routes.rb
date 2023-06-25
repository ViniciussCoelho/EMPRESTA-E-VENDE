Rails.application.routes.draw do
  root 'dashboard#index'

  resources :communities do
    resources :posts do
      resources :likeds
      resources :comments
    end
    resources :community_participants
  end

  get 'administration', to: 'administration#index'
  get 'administration/communities', to: 'administration#list_communities'
  get 'administration/admins', to: 'administration#list_admins'
  patch 'administration/admins/give_admin', to: 'administration#give_admin_permissions'
  patch 'administration/admins/remove_admin', to: 'administration#remove_admin_permissions'

  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get 'dashboard', to: 'dashboard#index', as: 'dashboard'
  get 'dashboard/my_contents', to: 'dashboard#my_contents', as: 'my_contents'
  get 'dashboard/find_communities', to: 'dashboard#find_communities', as: 'find_communities'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

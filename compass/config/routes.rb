Rails.application.routes.draw do
  resources :career_paths
  resources :users
  resources :companies
  resources :sectors
  resources :careers

  root 'career_paths#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

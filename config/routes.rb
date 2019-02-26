Rails.application.routes.draw do
  resources :users
  resources :job_experience_links
  resources :companies
  resources :sectors
  resources :job_experiences
  root 'job_experience_links#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

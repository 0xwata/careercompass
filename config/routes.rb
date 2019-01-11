Rails.application.routes.draw do
  resources :job_experience_links
  resources :companies
  resources :sectors
  resources :job_experiences
  root 'static_pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

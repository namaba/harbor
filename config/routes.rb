Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'

  resources :talents, only: %i[show]
  resources :lives, only: %i[index]

  namespace :admin do
    resources :talents
    resources :categories
    resources :platforms
  end
end

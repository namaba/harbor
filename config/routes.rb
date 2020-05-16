Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'

  resources :talents, only: %i[show] do
    get :archives, on: :member
  end

  resources :lives do
    get :latest_uploaded, on: :collection
  end

  namespace :admin do
    root to: 'lives#index'
    resources :talents
    resources :categories
    resources :platforms
    resources :lives
  end
end

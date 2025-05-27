Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :trial_requests, only: [:create]

  namespace :admin do
    resources :onboarding_templates do
      resources :steps, only: [:create, :update, :destroy]
    end
  end

  namespace :employee do
    get 'dashboard', to: 'dashboard#index'
    resources :onboarding_assignments, only: [:show] do
      member do
        patch :complete_step
      end
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end

Rails.application.routes.draw do
  resources :interfaces
  resources :users do
    collection do
      get 'dashboard'
      get 'notifications'
      get 'support'
      get 'plan'
      get 'billing'
      get 'notifications'
      get 'support'
      get 'profile'
    end

    member do
      get 'billing'
      get 'plan'
    end
  end

  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'

  root to: 'users#dashboard'
end

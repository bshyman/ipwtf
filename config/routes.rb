Rails.application.routes.draw do
  get 'home/landing'

  resources :interfaces do
    resources :notes, shallow: true
    get 'check_pulse'
  end

  resources :users do
    collection do
      get 'support'
      get 'plan'
      get 'billing'
      get 'notifications'
      get 'support'
    end

    member do
      get 'profile'
      get 'notifications'
      get 'dashboard'
      get 'billing'
      get 'plan'
    end
  end

  get '/google_login'=>'sessions#google_login'
  get '/auth/:provider/callback'=>'sessions#create'
  get '/signin'=>'sessions#new', :as=>:signin
  post '/login'=>'sessions#login', as: 'pw_login'
  get '/signout'=>'sessions#destroy', :as=>:signout
  get '/auth/failure'=>'sessions#failure'

  root to: 'home#landing'
end

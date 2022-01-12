Rails.application.routes.draw do
  resources :excels
  #get 'customer', to: 'customer#index'
  #get 'customer/new', to: 'customer#new'
  #resources :customer
  #resources :customers
  #get 'customer/ringo', to: 'customer#ringo'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :customers do
    collection do
      get 'ringo'
    end
  end

  namespace :staff, path: "" do
    root "top#index"
    get "login" => "sessions#new", as: :login
    #post "session" => "sessions#create", as: :session
    #delete "session" => "sessions#destroy"
    resource :session, only: [ :create, :destroy ]
    resource :account, except: [ :new, :create, :destroy ]
  end

  namespace :admin do
    root "top#index"
    get "login" => "sessions#new", as: :login
    #post "sesssion" => "sessions#create", as: :session
    #delete "sesssion" => "sessions#destroy"
    resource :session, only: [ :create, :destroy ]
    resources :staff_members
  end
end

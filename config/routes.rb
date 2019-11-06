Rails.application.routes.draw do
  root :to => 'events#index'
  
  devise_for :users

  resources :users, only: [:show]

  resources :events do 
    resources :participations, only: [:index, :new, :create, :show]
  end

  namespace :admin do
    root :to => 'admin#index'
    resources :users, except: [:new, :create]
    resources :events, except: [:new, :create]
  end
 
end

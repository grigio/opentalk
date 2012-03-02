# -*- encoding : utf-8 -*-
Opentalk::Application.routes.draw do

  

  resources :talks do
    member do
      get :toggle_vote
    end
    resources :comments
  end

  Mercury::Engine.routes

  resources :pages do
    member { post :mercury_update }
  end

  root :to => "pages#show", :id => 1

  resources :users, :admins do
    member do
      get :activate
    end
  end
  
  resources :user_sessions
  
  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout
  
  resource :oauth do
    get :callback
  end
  match "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider
  
end

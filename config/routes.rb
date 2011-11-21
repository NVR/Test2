Test2::Application.routes.draw do
  
  match '/events(/:year(/:month))' => 'events#index', :as => :events, :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}
  devise_for :users

  resources :users do
    resources :events, :only => 'index'
  end

  resources :events

  root :to => 'events#index'
  end

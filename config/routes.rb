Test2::Application.routes.draw do
  
  match '/events(/:year(/:month))' => 'events#index', :as => :events, :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}
  devise_for :users

  resources :events

  get 'events/test'

  root :to => 'events#index'
  end

Rails.application.routes.draw do
  resources :projects do
    resources :resources
  end

  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :people
  resources :other_names
  resources :sandboxes do
  	member do
      get 'clone'
    end
    member do
  		get 'export'
    end
  end
  resources :tests

  root to: 'visitors#index'
end

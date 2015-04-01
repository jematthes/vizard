Rails.application.routes.draw do
  get 'steps/index'
  get 'steps/step1'
  get 'steps/step4'
  resources :projects

  resources :resources

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

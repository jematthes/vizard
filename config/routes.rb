Rails.application.routes.draw do
  root to: 'visitors#index'
  resources :actors

  resources :activities do
    resources :asks
  end

  get 'solutions/aside', to: 'solutions#aside'
  get 'solutions/aside_form', to: 'solutions#aside_form'
  get 'solutions/list', to: 'solutions#list'

  get 'real_problems/focus_area', to: 'real_problems#focus_area'
  resources :real_problems do
    post 'create_ww', on: :collection
    patch 'update_ww',  on: :member
    resources :policy_problems do
      post 'create_ww', on: :collection
      patch 'update_ww', on: :member
      delete 'destroy_ww', on: :member
      resources :solutions do
        collection do
          post 'create_ww'
        end
      end
    end
  end

  resources :steps do
    get 'stage1', on: :collection
    get 'stage2', on: :collection
    get 'stage3', on: :collection
    get 'stage4', on: :collection
    get 'step1', on: :collection
    get 'step2', on: :collection
    get 'step3', on: :collection
    get 'step4', on: :collection
    get 'step6', on: :collection
    get 'index', on: :collection
  end

  resources :projects do
    resources :resources do
      get 'aside', on: :collection
      get 'aside', on: :member
    end
    resources :objectives do
      get 'stage3', on: :member
      get 'stage4', on: :member
      get 'actors', on: :member
      post :create_ww, on: :collection
      patch :update_ww, on: :member
      delete :destroy_ww, on: :member
      resources :outcomes
    end
    get 'stage1', on: :member
    get 'stage2', on: :member
    get 'stage4', on: :member
    get 'stage5', on: :member
    get 'stage6', on: :member
    get 'stage7', on: :member
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
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
  get '/javascript_test/:script' => 'javascript_test#render_test', :as => 'javascript_test'

  get '/models', to: 'visitors#models'
end

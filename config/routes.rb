Rails.application.routes.draw do
  get 'stats/index'
  get 'exams/index'
  get 'exams/show'
  root "portal/dashboard#index"
  
  devise_for :users

  scope module: 'static' do 
    scope controller: :home do
      get :about_us
      get :services
      get :projects
    end

    scope controller: :legal do 
      get :privacy_policy
      get :terms
    end
  end

  scope module: 'portal' do 
    resources :admin, only: :index
    resources :dashboard, only: :index
    resource :form_overview, only: :show

    resources :form_types, except: [:show] do 
      resources :forms
    end

    resources :notifications do 
      collection do 
        post :mark_as_read
      end
    end

    resources :courses
    resources :exams

    resources :stats, only: :index

     
    get "stats/new-forms"
    get "stats/new-users"
  end
end

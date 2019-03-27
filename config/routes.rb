Rails.application.routes.draw do
  root "portal/dashboard#index"
  
  devise_for :users, skip: :registrations

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

    resources :help, only: :index
    resources :feedbacks
  end
end

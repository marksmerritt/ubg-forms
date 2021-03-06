Rails.application.routes.draw do
  root "portal/form_overviews#show"

  constraints(:host => /united-masonry.herokuapp.com/) do
    match "/(*path)" => redirect {|params, req| "//ubgforms.com"}, via: [:get, :post]
  end
  
  devise_for :users, skip: :registrations, controllers: {
    invitations: "invitations"
  }

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
      resources :form_uploads
      patch :archive, on: :member
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
    get "stats/new-form-time"

    resources :help, only: :index
    resources :feedbacks do 
      patch :resolve, on: :member
    end
  end
end

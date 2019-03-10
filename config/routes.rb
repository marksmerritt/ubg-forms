Rails.application.routes.draw do
  root "static/home#index"
  
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
  end
end

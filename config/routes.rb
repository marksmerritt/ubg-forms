Rails.application.routes.draw do
  root "home#index"
  
  devise_for :users

  scope controller: :home do
    get :about_us
    get :services
    get :projects
  end

  scope controller: :legal do 
    get :privacy_policy
    get :terms
  end

  scope module: 'portal' do 
    resources :dashboard, only: :index
  end
end

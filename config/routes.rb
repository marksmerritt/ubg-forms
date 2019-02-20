Rails.application.routes.draw do
  root "home#index"

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
    resources :portal, only: [:index]
  end
end

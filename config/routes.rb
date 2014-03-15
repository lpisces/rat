Rat::Application.routes.draw do

  root :to => 'home#index'

  #account
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :sessions => "session", :registrations => "account", :passwords => "passwords"}
  devise_scope :user do 
    get "/passwords/message" => "passwords#message"
    #get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
    #get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
  end
  #cpanel
  match '/cpanel', :to => 'cpanel#index', :via => [:get]

  namespace :cpanel do
    resources :settings
  end
end

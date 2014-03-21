Rat::Application.routes.draw do

  root :to => 'home#index'

  #account
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :sessions => "session", :registrations => "account", :passwords => "passwords"}
  devise_scope :user do 
    get "/passwords/message" => "passwords#message"
  end

  #cpanel
  match '/cpanel', :to => 'cpanel#index', :via => [:get]

  namespace :cpanel do
    resources :settings
  end

  #profile
  match '/profile', :to => 'profile#info', :via => [:get]
  match '/profile/change_password', :to => 'profile#change_password', :via => [:get]
end

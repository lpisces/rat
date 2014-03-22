Rat::Application.routes.draw do

  namespace :cpanel do
    resources :attachments
  end

  root :to => 'home#index'

  #account
  devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks", :sessions => "session", :registrations => "account", :passwords => "passwords"} 
  devise_scope :user do 
    get "/passwords/message" => "passwords#message"
    get "/users/password/edit" => "profile#change_password"
  end

  #cpanel
  match '/cpanel', :to => 'cpanel#index', :via => [:get]

  namespace :cpanel do
    resources :settings
  end

  #profile
  match '/profile', :to => 'profile#info', :via => [:get,]
  match '/profile/update', :to => 'profile#update', :via => [:post,]
  match '/profile/avatar', :to => 'profile#avatar', :via => [:get, :post]
  match '/profile/change_password', :to => 'profile#change_password', :via => [:get,]
  match '/profile/update_password', :to => 'profile#update_password', :via => [:post,]
end

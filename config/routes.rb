Rat::Application.routes.draw do

  get "home/index"
  get "session/new"
  root :to => 'home#index'

  #devise_for :users, controllers: { sessions: "session", registration: 'register'}
  #account
  devise_for :users, :controllers => { :sessions => "session", :registrations => "account", :passwords => "passwords"}
  devise_scope :user do 
    get "/passwords/message" => "passwords#message"
  end
  #cpanel
  match '/cpanel', :to => 'cpanel#index', :via => [:get]

  namespace :cpanel do
    resources :settings
  end
end

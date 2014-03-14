Rat::Application.routes.draw do

  #cpanel
  match '/cpanel', :to => 'cpanel#index', :via => [:get]

  namespace :cpanel do
    resources :settings
  end
end

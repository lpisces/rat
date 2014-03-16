class IdentitiesController < ApplicationController
  layout 'cpanel'
  @identity = env['omniauth.identity']
end

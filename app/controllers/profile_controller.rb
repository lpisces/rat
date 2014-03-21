class ProfileController < ApplicationController
  layout 'application'

  def info
    @user = current_user
  end

  def change_password
  end
end

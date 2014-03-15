class CpanelController < ApplicationController

  before_filter :admin_required?
  layout 'cpanel'

  def admin_required?
    redirect_to new_user_session_path unless current_user.try(:admin?)
  end

  def index
  end
end

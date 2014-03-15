class PasswordsController < Devise::PasswordsController
  layout 'cpanel'

  def message
  end

protected
  def after_sending_reset_password_instructions_path_for(resource_name)
    #new_session_path(resource_name) if is_navigational_format?
    passwords_message_path if is_navigational_format?
  end


end

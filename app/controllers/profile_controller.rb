class ProfileController < ApplicationController
  before_filter :authenticate_user!

  def info
    @user = current_user
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(profile_params)
      redirect_to profile_path, notice: I18n.t('profile.update_succeed')
    else
      redirect_to profile_path, alert: I18n.t('profile.update_failed')
    end
  end

  def change_password
    @user = current_user
  end

  def update_password
    @user = User.find(current_user.id)
    if @user.update_with_password(profile_password_params)
      sign_in @user, :bypass => true
      redirect_to profile_change_password_path, notice: I18n.t('profile.update_password_succeed')
    else
      redirect_to profile_change_password_path, alert: I18n.t('profile.update_password_failed')
    end
  end

  def avatar
    params.permit!
    @att = Attachment.new
    @att.name = params[:avatar].original_filename
    @att.file = params[:avatar]
    @att.save
    render :json => @att
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:user).permit(:avatar, :nick)
    end

    def profile_password_params
      params.require(:user).permit(:password, :password_confirmation, :current_password)
    end

end

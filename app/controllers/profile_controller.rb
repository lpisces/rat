class ProfileController < ApplicationController
  before_filter :authenticate_user!

  def info
    @user = current_user
  end

  def update
    respond_to do |format|
      if current_user.update(profile_params)
        format.html { redirect_to profile_path, notice: I18n.t('profile.update_succeed') }
        format.json { head :no_content }
      else
        format.html { redirect_to profile_path, notice: I18n.t('profile.update_failed') }
        format.json { head :no_content }
      end
    end
  end


  def change_password
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

end

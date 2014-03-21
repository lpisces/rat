class Cpanel::AttachmentsController < ApplicationController
  layout 'cpanel'
  before_action :set_cpanel_attachment, only: [:show, :edit, :update, :destroy]

  # GET /cpanel/attachments
  # GET /cpanel/attachments.json
  def index
    @cpanel_attachments = Cpanel::Attachment.all
  end

  # GET /cpanel/attachments/1
  # GET /cpanel/attachments/1.json
  def show
  end

  # GET /cpanel/attachments/new
  def new
    @cpanel_attachment = Cpanel::Attachment.new
  end

  # GET /cpanel/attachments/1/edit
  def edit
  end

  # POST /cpanel/attachments
  # POST /cpanel/attachments.json
  def create
    @cpanel_attachment = Cpanel::Attachment.new(cpanel_attachment_params)

    respond_to do |format|
      if @cpanel_attachment.save
        format.html { redirect_to @cpanel_attachment, notice: 'Attachment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @cpanel_attachment }
      else
        format.html { render action: 'new' }
        format.json { render json: @cpanel_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cpanel/attachments/1
  # PATCH/PUT /cpanel/attachments/1.json
  def update
    respond_to do |format|
      if @cpanel_attachment.update(cpanel_attachment_params)
        format.html { redirect_to @cpanel_attachment, notice: 'Attachment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cpanel_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cpanel/attachments/1
  # DELETE /cpanel/attachments/1.json
  def destroy
    @cpanel_attachment.destroy
    respond_to do |format|
      format.html { redirect_to cpanel_attachments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cpanel_attachment
      @cpanel_attachment = Cpanel::Attachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cpanel_attachment_params
      params.require(:cpanel_attachment).permit(:name, :file)
    end
end

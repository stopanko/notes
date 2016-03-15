class AttachmentsController < ApplicationController
  before_action :authenticate_user!

  before_action :get_note, only: [:create, :download, :destroy]
  before_action :get_photo, only: [:download, :destroy]

  def create
    @attachment = @note.attachments.create(attachment_params)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @attachment.destroy
    respond_to do |format|
      format.js
    end
  end

  def download
    send_file @attachment.file.path
  end

  private

  def get_note
    @note = current_user.notes.find(params[:note_id])
  end

  def get_photo
    @attachment = @note.attachments.find(params[:id])
  end

  def attachment_params
    params.require(:attachment).permit(:file)
  end
end

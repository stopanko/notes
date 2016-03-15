class PhotosController < ApplicationController
  before_action :get_note, only: [:create, :download, :destroy]
  before_action :get_photo, only: [:download, :destroy]

  def create
    @photo = @note.photos.create(photo_params)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @photo.destroy
    respond_to do |format|
      format.js
    end
  end

  def download
    send_file @photo.image.path, :type => 'image/jpeg'
  end

  private

  def get_note
    @note = current_user.notes.find(params[:note_id])
  end

  def get_photo
    @photo = @note.photos.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:image)
  end
end

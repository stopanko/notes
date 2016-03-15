class PhotosController < ApplicationController
  before_action :get_note, only: [:create]

  def create
    @photo = @note.photos.create(photo_params)
    respond_to do |format|
      format.js
    end
  end

  def download

  end

  private

  def get_note
    @note = current_user.notes.find(params[:note_id])
  end

  def get_photo
    @photo = Photo.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:image)
  end
end

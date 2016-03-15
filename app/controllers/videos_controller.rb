class VideosController < ApplicationController
  before_action :get_note, only: [:create, :download, :destroy]
  before_action :get_video, only: [:download, :destroy]

  def create
    @video = @note.videos.create(video_params)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @video.destroy
    respond_to do |format|
      format.js
    end
  end

  def download
    send_file @video.video.path, :type => 'video/mp4'
  end

  private

  def get_note
    @note = current_user.notes.find(params[:note_id])
  end

  def get_video
    @video = @note.videos.find(params[:id])
  end

  def video_params
    params.require(:video).permit(:video)
  end
end

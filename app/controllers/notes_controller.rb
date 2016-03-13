class NotesController < ApplicationController

  before_action :authenticate_user!

  def index
    @notes = current_user.notes.order(created_at: :desc).paginate(page: params[:page], per_page: 20)
  end

  def new
    @note = current_user.notes.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @note = current_user.notes.new(note_params)
    @note.save
    respond_to do |format|
      format.js
    end
  end

  private

  def note_params
    params.require(:note).permit(:title, :body)
  end


end

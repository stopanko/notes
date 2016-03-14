class NotesController < ApplicationController

  before_action :authenticate_user!
  before_action :get_note, only: [:edit, :update, :destroy]

  def index
    @notes = current_user.notes.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
  end

  def new
    @note = current_user.notes.new
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @note.destroy
    respond_to do |format|
      format.js
    end
  end

  # def get_more_notes
  #   @notes
  # end

  def update
    @note.update(note_params)
    respond_to do |format|
      format.js
    end
  end

  def edit
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

  def get_note
    @note = current_user.notes.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :body)
  end


end

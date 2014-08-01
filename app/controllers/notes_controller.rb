class NotesController < ApplicationController
  before_action :can_destroy, only: [:destroy]

  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id
    @note.track_id = params[:track_id]
    @track = @note.track
    if @note.save
      redirect_to track_url(@track)
    else
      flash[:errors] = @note.errors.full_messages
      redirect_to track_url(@track)
      #fail
    end
  end

  def edit

  end

  def update

  end

  def destroy
    @note = Note.find(params[:id])
    @track = Track.find(@note.track_id)
    if @note.destroy
      redirect_to track_url(@track)
    else
      redirect_to track_url(@track)
    end
  end

  def note_params
    params.require(:note).permit(:track_id, :user_id, :text)
  end

  def can_destroy
    @note = Note.find(params[:id])
    render text: "Can't do that!" unless current_user.id == @note.user_id
  end
end
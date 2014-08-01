class TracksController < ApplicationController
  def new
    @track = Track.new
    @albums = Album.all
    render :new
  end

  def create
    @track = Track.new(track_params)
    @album = Album.find(@track.album_id)
    if @track.save
      redirect_to album_url(@album)
    else
      flash[:errors] = @album.errors.full_messages
      redirect_to new_album_track(@album)
    end
  end

  def update
    @track = Track.find(params[:id])
    @album = Album.find(@track.album_id)
    if @track.update(track_params)
      redirect_to album_url(@album)
    else
      flash[:errors] = @track.errors.full_messages
      redirect_to edit_track_url
    end
  end

  def destroy
    @track = Track.find(params[:id])
    @album = Album.find(@track.album_id)
    if @track.destroy
      redirect_to album_url(@album)
    else
      flash[:errors] = @track.errors.full_messages
      redirect_to album_url(@album)
    end
  end

  def show
    @track = Track.find(params[:id])
    @album = Album.find(@track.album_id)
    @notes = Note.includes(:user).where(track_id: @track.id)
    @note = Note.new
    render :show
  end

  def edit
    @track = Track.find(params[:id])
    @albums = Album.all
    render :edit
  end

  def track_params
    params.require(:track).permit(:title, :album_id, :track_number, :track_type, :lyrics)
  end

end
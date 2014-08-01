class TracksController < ApplicationController
  before_action :check_signin

  def new
    @track = Track.new
    @albums = Album.find(params[:album_id]).band.albums
    render :new
  end

  def create
    @track = Track.new(track_params)
    @album = Album.find(@track.album_id)
    if @track.save
      redirect_to album_url(@album)
    else
      flash[:errors] = @track.errors.full_messages
      redirect_to new_album_track_url(@album)
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
    @album = @track.album
    @band = @album.band
    @notes = Note.includes(:user).where(track_id: @track.id)
    @note = Note.new
    render :show
  end

  def edit
    @track = Track.find(params[:id])
    @albums = Album.all
    @album = @track.album
    @band = @album.band
    render :edit
  end

  def track_params
    params.require(:track).permit(:title, :album_id, :track_number, :track_type, :lyrics)
  end

end
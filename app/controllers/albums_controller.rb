class AlbumsController < ApplicationController
  before_action :check_signin

  def new
    @album = Album.new
    @band = Band.find(params[:band_id])
    @bands = Band.all
    render :new
  end

  def create
    @album = Album.new(album_params)
    @band = @album.band
    if @album.save
      redirect_to album_url(@album)
    else
      flash[:errors] = @album.errors.full_messages
      @bands = Band.all
      render :new
    end
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to band_url(@album.band)
    else
      flash[:errors] = @album.errors.full_messages
      redirect_to edit_album_url
    end
  end

  def destroy
    @album = Album.find(params[:id])
    if @album.destroy
      redirect_to bands_url
    else
      flash[:errors] = @album.errors.full_messages
      redirect_to bands_url
    end
  end

  def show
    @album = Album.find(params[:id])
    @band = @album.band
    @tracks = @album.tracks.order(:track_number)
    render :show
  end

  def edit
    @album = Album.find(params[:id])
    @band = @album.band
    render :edit
  end

  def album_params
    params.require(:album).permit(:title, :recording_type, :band_id)
  end
end
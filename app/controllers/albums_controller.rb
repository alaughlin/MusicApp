class AlbumsController < ApplicationController
  def new
    @album = Album.new
    @bands = Band.all
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      flash[:errors] = @album.errors.full_messages
      #redirect_to new_band_album_url(@band)
    end
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to album_url(@album)
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
    @album_band = @album.band
    @album_tracks = @album.tracks.order(:track_number)
    render :show
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def album_params
    params.require(:album).permit(:title, :recording_type, :band_id)
  end
end
class AlbumsController < ApplicationController
  def new
    @album = Album.new
    @bands = Band.all 
    render :new
  end

  def create
    @album = Album.new(album_params)
    @band = Band.find(@album.band_id)
    if @album.save
      redirect_to album_url(@album)
    else
      flash[:errors] = @album.errors.full_messages
      redirect_to band_url(@band)
    end
  end

  def album_params
    params.require[:album].permit(:title, :year, :status)
  end
end

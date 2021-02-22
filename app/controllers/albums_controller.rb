class AlbumsController < ApplicationController
  before_action :redirect_if_not_logged_in
  before_action :set_album, only: [:show, :edit, :update]
  def new
    @album = Album.new  
  end

  def create
   @album = Album.new(album_params)
    if @album.save
      redirect_to new_album_song_path(@album)
    else
      :new
    end 
  end
    
  def index
    @albums = Album.recent
  end 

  def edit
  end 

  def show

  end

  def update

    if @album.update(album_params)
      redirect_to @album
    else
      render :edit
    end

  end 

  def destroy
      @album = Album.find_by_id(params[:id])
      @album.destroy
      redirect_to albums_path  
  end
  

    private

    def album_params
        params.require(:album).permit(:name, :release_date, :musician_id, :artwork)
    end 

    def set_album
      @album = Album.find_by_id(params[:id])
      redirect_to albums_path if !@album
   end
end


# t.binary "artwork"
  #   t.string "name"
   #  t.date "release_date"
    # t.integer "musician_id"
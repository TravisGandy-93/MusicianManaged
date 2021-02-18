class AlbumsController < ApplicationController
  before_action :redirect_if_not_logged_in
    def new
        @album = Album.new
        
    end

    def create

        @album = Album.new(album_params)

        
      if @album.save
        redirect_to new_album_song_path(@album, @song)
      else
        new_album_path
      end 
    end
    
    def index
        @albums = Album.all
    end 

    def edit
    end 

    def show
      @album = Album.find_by_id(params[:id])
      @songs = Song.find_by_id(params[:album_id])
    end

    def destroy
      @album = Album.find_by_id(params[:id])
      @album.destroy
      flash[:notice] = "album deleted."
      redirect_to albums_path
    end
  

    private

    def album_params
        params.require(:album).permit(:name, :release_date, :musician_id, :artwork)
    end 
end


# t.binary "artwork"
  #   t.string "name"
   #  t.date "release_date"
    # t.integer "musician_id"
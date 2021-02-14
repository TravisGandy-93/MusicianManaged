class AlbumsController < ApplicationController
    def new
        @album = Album.new(album_params)
    end 

    def create
        @album = Album.new(album_params)
        @album.user_id = session[:user_id]
        if @album.save
       redirect_to album_path(@album)
        else
       redirect_to new_album_path
        end
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
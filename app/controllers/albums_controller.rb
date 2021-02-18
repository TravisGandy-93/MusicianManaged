class AlbumsController < ApplicationController
   
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

    def edit

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
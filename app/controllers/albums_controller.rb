class AlbumsController < ApplicationController
   
    def new
        @musician_id = params[:musician_id]

    end

    def create
        album = Album.new(album_params)
        album.musician_id = params[:musician_id]
        album.save!
        redirect_to "/albums/#{album.id}/songs/new"
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
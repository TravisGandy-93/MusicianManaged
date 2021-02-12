class SongsController < ApplicationController
    def new
        @song = Song.new
        @song.build_musician
    end 

    def create
        @song = Song.new(song_params)
        if @song.save
       redirect_to song_path
        else
      redirect_to :new
        end
    end

    private

    def song_params
        params.require(:song).permit(:title, :length, :musician_id, musician_attributes: [:name])
    end 
end

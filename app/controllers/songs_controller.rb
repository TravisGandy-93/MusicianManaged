class SongsController < ApplicationController
    def new
        @song = Song.new
        @song.build_musician
        @song.save
    end 

    def create
        @song = Song.new(song_params)
        @song.user_id = session[:user_id]
        
        if @song.save!
       redirect_to song_path(@song)
        else
       redirect_to new_song_path
        end
    end

    private

    def song_params
        params.require(:song).permit(:title, :length, :musician_id, musician_attributes: [:name], musician_attributes: [:instrument], :album_id)
    end 
end

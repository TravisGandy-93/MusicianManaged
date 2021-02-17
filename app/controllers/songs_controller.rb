class SongsController < ApplicationController
    def new 
        @song = Song.new
    end 

    def create
        song = Song.new(song_params)
        
    
        if song.save!
            redirect_to songs_path
       else
            redirect_to new_song_path
       end 
    end

    private

    def song_params
        params.require(:song).permit(:title, :length, :user_id, :album_id, :musician_id)
    end

end

#, :album_id, album_attributes: [:name, :release_date], song_attributes: [:name, :instrument]
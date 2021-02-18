class SongsController < ApplicationController
    def new 
        if @album = Album.find_by_id(params[:album_id])
        @song = @album.songs.build
        else
            @song = Song.new
        end
    
    end 

    def create
        @song = Song.new(song_params)
        @song.user_id = session[:user_id]
        @album = Album.find_by_id(params[:album_id])
        @song.musician_id = @album.musician_id
        if @song.save!
            redirect_to album_songs_path
       else
            redirect_to new_song_path
       end 
    end

    def index
        if @album = Album.find_by_id(params[:album_id])
            @songs = @album.songs
          else
            @songs = Song.all
          end
    end 

    def show
        @song = Song.find_by_id(params[:id])
    end

    private

    def song_params
        params.require(:song).permit(:title, :length, :user_id, :album_id, :musician_id)
    end

end

#, :title, :length, :user_id, :album_id, :musician_id
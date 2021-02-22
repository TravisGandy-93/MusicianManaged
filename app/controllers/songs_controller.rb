class SongsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_song, only: [:show, :update, :edit, :destroy]
    def new 
        if @album = Album.find_by_id(params[:album_id])
        @song = @album.songs.build
       @song.build_genre
        else
            @song = Song.new
        end
    
    end 

    def create
        @song = Song.new(song_params)
        @song.user_id = session[:user_id]
        @album = Album.find_by_id(params[:album_id])
        @song.musician_id = @album.musician_id
        #byebug
        if @song.save
            redirect_to album_songs_path
       else
            redirect_to new_album_song_path(@album)
       end 
    end

    def index 
        @album = Album.find_by_id(params[:album_id])
        @songs = Song.all 
    end 

    def show
    end

    def edit
        @album = Album.find(params[:album_id])
        @song = @album.songs.find(params[:id])
    end

    def update

        if @song.update(song_params)
            redirect_to album_song_path(@song)
          else
            render :edit
        end
    end

    def destroy
        @album = Album.find_by_id(params[:album_id])
        @song = @album.songs.find(params[:id])
        @song.destroy
        redirect_to album_path(@album)
    end

    private

    def song_params
        params.require(:song).permit(:title, :length, :user_id, :album_id, :musician_id, genre_attributes: [:name, :album_id])
    end

    def set_song
        @song = Song.find_by_id(params[:id])
    end

end

#, :title, :length, :user_id, :album_id, :musician_id
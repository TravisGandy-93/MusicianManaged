class GenresController < ApplicationController

def new
    @genre = Genre.new
end 

def create
    @genre = Genre.new(genre_params)
    @song = Song.find_by_id(params[:song_id])
    @genre.album_id = @song.album_id
    if @genre.save
        redirect_to album_song_path(@song)
    else
        
    end
end

private 

def genre_params
    params.require(:genre).permit(:name, :album_id, :song_id)
end 

end 
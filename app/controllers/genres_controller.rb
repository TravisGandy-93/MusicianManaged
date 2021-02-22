class GenresController < ApplicationController

def new
    @genre = Genre.new
end 



private 

def genre_params
    params.require(:genre).permit(:name, :album_id, :song_id)
end 

end 
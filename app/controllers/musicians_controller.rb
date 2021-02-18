class MusiciansController < ApplicationController

    def new
        
        @musician = Musician.new
    
    end 

    def create
     musician = Musician.new(musician_params)
   
        if musician.save
            redirect_to musicians_path
       else
        
            redirect_to new_musician_path
       end 
    end

    def index
        @musicians = Musician.all
        
    end

    private

    def musician_params
        params.require(:musician).permit(:name, :instrument, :members)
    end 
end

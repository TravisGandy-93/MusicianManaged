class MusiciansController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_musician, only: [:show, :edit, :update, :destroy]
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

    def show
    end 

    def index
        @musicians = Musician.all
    end

    def edit
    end

    def update
        if @musician.update(musician_params)
            redirect_to @musician
          else
            render :edit
          end
    end

    def destroy
        @musician.destroy
        redirect_to musicians_path
    end 

    private

    def musician_params
        params.require(:musician).permit(:name, :instrument, :members)
    end 

    def set_musician
        @musician = Musician.find_by_id(params[:id])
        redirect_to musicians_path if !@musician
     end
end

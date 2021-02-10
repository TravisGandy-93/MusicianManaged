class UsersController < ApplicationController
    def new
        @user = User.new
    end 

    def create
        @user = user.new(user_params)
        if @user.save
       redirect_to user_path(@user)
        else
      render 'new'
        end
    end

    def show
        @user = User.find_by_id(params[:id])
        if !@user
            redirect_to '/'
    end 

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end 
end

class SessionsController < ApplicationController
    def welcome
        @user = current_user
        redirect_to user_path(@user) if current_user
    end

    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end 

    def create
      if params[:provider] == 'github'
        @user = User.create_by_github_omniauth(auth)
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        @user = User.find_by(email: params[:user][:email])
        if @user.try(:authenticate, params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:error] = "Sorry that's a bad combination"
            redirect_to login_path
        end
    end 
    end 


    private

    def auth
        request.env['omniauth.auth']
    end
end
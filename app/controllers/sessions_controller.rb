class SessionsController < ApplicationController
    def welcome
    end

    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end 

    def create
      #  @user = User.find_by(email: params[:user][:email])
     #   if @user.try(:authenticate, params[:user][:password])
     #       session[:user_id] = @user.id
     #       redirect_to user_path(@user)
     #   else
     #       flash[:error] = "Sorry that's a bad combination"
     #       redirect_to login_path
      #  end
    end 

    def omniauth
        @user = User.create_by_facebook_omniauth(auth)
    
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    private

    def auth
        request.env['omniauth.auth']
    end
end
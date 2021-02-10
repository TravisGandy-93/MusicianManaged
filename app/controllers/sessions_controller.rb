class SessionsController < ApplicationController
    def welcome
    end

    def destroy
        session.delete[:user_id]
    end 
end
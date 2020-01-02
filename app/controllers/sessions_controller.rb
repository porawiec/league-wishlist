class SessionsController < ApplicationController

    def create
        player = Player.find_by(username: params[:username])
        if player && player.authenticate(params[:password])
            session[:player_id] = player.id
            redirect_to player
        else
        flash[:message] = "Invalid Credentials" 
        redirect_to new_session_path
        end
    end

    def new
    end

    def destroy
        session.clear
        session.delete(:player_id)
        redirect_to new_session_path
    end

end
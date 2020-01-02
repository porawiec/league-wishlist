module ApplicationHelper

    def logged_in?
        !!current_player
    end

    def current_player
        @_current ||= Player.find_by(id: session[:player_id])
    end

    def authorize!
        redirect_to login_path if !logged_in?
    end

    def authorize_viewing_self!
        flash[:message] = "You do not have permission to view this page."
        redirect_to current_player if current_player.id != params[:id].to_i
    end

    def flash_message
        @_msg ||= flash[:message]
    end

end

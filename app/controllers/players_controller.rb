class PlayersController < ApplicationController

    before_action :authorize!, only: [:new, :create]
    # before_action :authorize_viewing_self!, only: [:edit, :update]

    def new
        @player = Player.new
    end

    def create
        player = Player.new(params.require(:player).permit(:username, :password))
        if player.valid?
            player.save
            redirect_to players_path
            session[:player_id] = player.id
        else
            redirect_to new_player_path
        end
    end

    def index
        @players = Player.all
    end

    def show
        @player = Player.find_by(id: params[:id])
        # render :show
    end
end
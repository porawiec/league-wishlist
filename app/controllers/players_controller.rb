class PlayersController < ApplicationController

    before_action :authorize!, except: [:new]
    before_action :authorize_viewing_self!, only: [:show, :edit, :update]

    def new
        @player = Player.new
    end

    def create
        player = Player.new(params.require(:player).permit(:username, :password))
        if player.valid?
            player.save
            redirect_to players_path
            session[:player_id] = player.id
        end
    end

    def index
        @players = Player.all
    end

    def show
        @player = Player.find_by(id: params[:id])
        render :show
    end

    def edit
    end
end
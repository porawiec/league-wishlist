class ChampsController < ApplicationController

    def index
        @champs = Champ.all
    end

    def show
        @champ = Champ.find_by(id: params[:id])
        render :show
    end
end
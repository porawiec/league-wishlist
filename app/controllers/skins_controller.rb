class SkinsController < ApplicationController

    def index
        @skins = Skin.all
    end

    def show
        @skin = Skin.find_by(id: params[:id])
        render :show
    end
end
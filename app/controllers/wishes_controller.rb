class WishesController < ApplicationController

    # before_action :authorize!, except: [:new]
    # before_action :authorize_viewing_self!, only: [:show, :edit, :update]

    def new
        @wish = Wish.new
    end

    def create
        @wish = Wish.new(wish_params)
        @wish["player_id"] = session[:player_id]

        if @wish.valid?
            @wish.save
            redirect_to @wish
        else
           p flash[:errors] = @wish.errors.full_messages
            redirect_to new_wish_path
        end
    end

    def index
        @wishes = Wish.all
    end

    def show
        @wish = Wish.find_by(id: params[:id])
        render :show
    end

    def edit
        @wish = Wish.find_by(id: params[:id])
        @errors = flash[:errors]
    end

    def update
        @wish = Wish.find_by(id: params[:id])
        @wish.update(wish_params)

        if @wish.valid?
            redirect_to @wish
        else
            flash[:errors] = @wish.errors.full_messages
            redirect_to edit_wish_path
        end
    end

    private

    def wish_params
        params.require(:wish).permit(:rank, :champ_id)
    end
end
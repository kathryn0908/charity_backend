class FavoritesController < ApplicationController
    before_action :find_favorite, only: [:show, :update, :destroy]
    

    def index
        @favorites = Favorite.all
        render json: @favorites
    end

    def show 
        render json: @favorites
    end

    def create
        @favorite = Favorite.new(favorite_params)

        if @favorite.save
            render json: @favorite
        else  
            render json: @favorite.errors, status: :unprocessable_entity
        end
    end

    def update
        if @favorite.update(favorite_params)
            render json: @favorite
        else
            render json: @favorite.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @favorite.destroy

        render json: @favorites
    end

    private

    def find_favorite
        @favorite = Favorite.find(params[:id])
    end

    def favorite_params
        params.require(:favorite).permit([:user_id, :charity_id])
    end
end


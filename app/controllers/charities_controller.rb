class CharitiesController < ApplicationController

    before_action :find_charity, only: [:show, :update, :destroy]
    

    def index
        @charities = Charity.all
        render json: @charities
    end

    def show 
        render json: @charity
    end

    def create
        @charity = Charity.new(charity_params)

        if @charity.save
            render json: @charity
        else  
            render json: @charity.errors, status: :unprocessable_entity
        end
    end

    def update
        if @charity.update(charity_params)
            render json: @charity
        else
            render json: @charity.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @charity.destroy

        render json: @charities
    end

    private

    def find_charity
        @charity = Charity.find(params[:id])
    end

    def charity_params
        params.require(:charity).permit([:charity_name, :url, :donation_url, :city, :state, :category])
    end
end

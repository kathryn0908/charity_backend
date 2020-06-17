class DonationsController < ApplicationController
    before_action :find_donation, only: [:show, :update, :destroy]
    

    def index
        @donations = Donation.all
        render json: @donations
    end

    def show 
        render json: @donation
    end

    def create
        @donation = Donation.new(donation_params)
        
        if @donation.save
            render json: @donation
        else  
            render json: @donation.errors, status: :unprocessable_entity
        end
    end

    def update
        if @donation.update(donation_params)
            render json: @donation
        else
            render json: @donation.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @donation.destroy

        render json: @donations
    end

    private

    def find_donation
        @donation = Donation.find(params[:id])
    end

    def donation_params
        params.require(:donation).permit([:user_id, :charity_id, :amount])
    end
end



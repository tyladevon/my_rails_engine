class Api::V1::Merchants::MostRevenueController < ApplicationController
    def index
        most = Merchant.most_revenue(params[:quantity])
        render json: MerchantSerializer.new(most)
    end 
end
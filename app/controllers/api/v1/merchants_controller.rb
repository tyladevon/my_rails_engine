class Api::V1::MerchantsController < ApplicationController
    def index
        merchants = Merchant.all 
        serialized_merchants = MerchantSerializer.new(merchants)
        render json: serialized_merchants
    end 
    
    def show
        merchant = Merchant.find(params[:id])
        serialized_merchant = MerchantSerializer.new(merchant)
        render json: serialized_merchant
    end 

    def find
        merchant = Merchant.find_by(merch_params)
        serialized_merchant = MerchantSerializer.new(merchant)
        render json: serialized_merchant
    end 

    def find_all
        merchants = Merchant.where(merch_params)
        serialized_merchants = MerchantSerializer.new(merchants)
        render json: serialized_merchants
    end 

    def random
        merchant = Merchant.random
        serialized_merchant = MerchantSerializer.new(merchant)
        render json: serialized_merchant
    end 

    private 
    def merch_params
        params.permit(:id, :name, :created_at, :updated_at)
    end 
end 
class Api::V1::MerchantsController < ApplicationController
    def index
        merchants = Merchant.all 
        serialized_merchants = MerchantSerializer.new(merchants)
        render json: serialized_merchants
    end 

    def show
        items = Item.where(merchant_id: params[:id])
        serialized_items = ItemSerializer.new(items)
        render json: serialized_items
    end 
end 
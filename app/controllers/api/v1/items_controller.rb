class ItemsController < ApplicationController
    def show
        items = Item.where(merchant_id: params[:id])
        serialized_items = ItemSerializer.new(items)
        render json: serialized_items
    end 

end 
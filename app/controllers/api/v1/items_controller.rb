class Api::V1::ItemsController < ApplicationController
    
    def index
        items = Item.all
        serialized_items = ItemSerializer.new(items)
        render json: serialized_items
    end 

    def show
        item = Item.find(params[:id])
        serialized_items = ItemSerializer.new(item)
        render json: serialized_items
    end 

    def find
        item = Item.find_by(item_params)
        serialized_item = ItemSerializer.new(item)
        render json: serialized_item
    end 

    def find_all
        items = Item.where(item_params)
        serialized_items = ItemSerializer.new(items)
        render json: serialized_items
    end 

    def random
        item = Item.random
        serialized_item = ItemSerializer.new(item)
        render json: serialized_item
    end

    private

    def item_params
        params.permit(:id, :name, :description, :unit_price, :created_at, :updated_at)
    end 

end 
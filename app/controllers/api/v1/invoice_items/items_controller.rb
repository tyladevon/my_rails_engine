class Api::V1::InvoiceItems::ItemsController < ApplicationController
     def show
        invoice_item = InvoiceItem.find(params[:id])
        serialized_item = ItemSerializer.new(invoice_item.item)
        render json: serialized_item
    end 
end 
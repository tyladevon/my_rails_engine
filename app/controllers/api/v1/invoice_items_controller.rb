class Api::V1::InvoiceItemsController < ApplicationController
    def index
        invoice_items = InvoiceItem.all
        serialized_invoice_items = InvoiceItemSerializer.new(invoice_items)
        render json: serialized_invoice_items
    end 

    def show
        invoice_item = InvoiceItem.find(params[:id])
        serialized_invoice_items = InvoiceItemSerializer.new(invoice_item)
        render json: serialized_invoice_items
    end 

    def find
        invoice_item = InvoiceItem.find_by(invoice_items_params)
        serialized_invoice_item = InvoiceItemSerializer.new(invoice_item)
        render json: serialized_invoice_item
    end 

    def find_all
        invoice_items = InvoiceItem.where(invoice_items_params)
        serialized_invoice_items = InvoiceItemSerializer.new(invoice_items)
        render json: serialized_invoice_items
    end 

    def random
        invoice = InvoiceItem.random
        serialized_invoice = InvoiceItemSerializer.new(invoice)
        render json: serialized_invoice
    end

    private

    def invoice_items_params
        params.permit(:id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at)
    end 

end 
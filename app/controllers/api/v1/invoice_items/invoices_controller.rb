class Api::V1::InvoiceItems::InvoicesController < ApplicationController
     def show
        invoice_item = InvoiceItem.find(params[:id])
        serialized_invoice = InvoiceSerializer.new(invoice_item.invoice)
        render json: serialized_invoice
    end 
end 
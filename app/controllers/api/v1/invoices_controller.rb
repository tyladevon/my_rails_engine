class Api::V1::InvoicesController < ApplicationController 
    
    def index
        invoices = Invoice.all
        serialized_invoices = InvoiceSerializer.new(invoices)
        render json: serialized_invoices
    end 

    def show
        invoice = Invoice.where(params[:invoice_id])
        serialized_invoices = InvoiceSerializer.new(invoice)
        render json: serialized_invoices
    end 

    def find
        invoice = Invoice.find_by(invoice_params)
        serialized_invoice = InvoiceSerializer.new(invoice)
        render json: serialized_invoice
    end 

    def find_all
        invoices = Invoice.where(invoice_params)
        serialized_invoices = InvoiceSerializer.new(invoices)
        render json: serialized_invoices
    end 

    def random
        invoice = Invoice.all.sample
        serialized_invoice = InvoiceSerializer.new(invoice)
        render json: serialized_invoice
    end

    private

    def invoice_params
        params.permit(:id, :customer_id, :merchant_id, :created_at, :updated_at)
    end 

end 
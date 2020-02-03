class Api::V1::Transactions::InvoicesController < ApplicationController
     def show
        transaction = Transaction.find(params[:id])
        serialized_invoice = InvoiceSerializer.new(transaction.invoice)
        render json: serialized_invoice
    end 
end 
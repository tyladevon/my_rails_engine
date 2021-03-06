class Api::V1::Invoices::TransactionsController < ApplicationController
     def index
        invoice = Invoice.find(params[:id])
        # transactions = Transaction.where(invoice_id: params[:id])
        serialized_transactions = TransactionSerializer.new(invoice.transactions)
        render json: serialized_transactions
    end 
end 
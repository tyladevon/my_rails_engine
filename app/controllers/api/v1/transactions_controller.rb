class Api::V1::TransactionsController < ApplicationController 
    def index
        transactions = Transaction.all
        serialized_transactions = TransactionSerializer.new(transactions)
        render json: serialized_transactions
    end 

    def show
        transaction = Transaction.find(params[:id])
        serialized_transactions = TransactionSerializer.new(transaction)
        render json: serialized_transactions
    end 

    def find
        transaction = Transaction.find_by(transaction_params)
        serialized_transaction = TransactionSerializer.new(transaction)
        render json: serialized_transaction
    end 

    def find_all
        transactions = Transaction.where(transaction_params)
        serialized_transactions = TransactionSerializer.new(transactions)
        render json: serialized_transactions
    end 

    def random
        transaction = Transaction.random
        serialized_transaction = TransactionSerializer.new(transaction)
        render json: serialized_transaction
    end

    private

    def transaction_params
        params.permit(:id, :invoice_id, :credit_card_number, :result, :created_at, :updated_at)
    end 
end 
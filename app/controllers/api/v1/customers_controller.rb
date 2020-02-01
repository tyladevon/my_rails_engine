class Api::V1::CustomersController < ApplicationController
    
    def index
        customers = Customer.all
        serialized_customers = CustomerSerializer.new(customers)
        render json: serialized_customers
    end 

    def show
        customer = Customer.find(params[:id])
        serialized_customers = CustomerSerializer.new(customer)
        render json: serialized_customers
    end 

    def find
        customer = Customer.find_by(customer_params)
        serialized_customer = CustomerSerializer.new(customer)
        render json: serialized_customer
    end 

    def find_all
        customers = Customer.where(customer_params)
        serialized_customers = CustomerSerializer.new(customers)
        render json: serialized_customers
    end 

    def random
        customer = Customer.random
        serialized_customer = CustomerSerializer.new(customer)
        render json: serialized_customer
    end

    private

    def customer_params
        params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
    end 

end 
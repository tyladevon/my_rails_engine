require 'rails_helper'

describe 'Customers record endpoints' do 
    it 'can see a list of customers' do
        create_list(:customer, 5)

        get '/api/v1/customers'

        expect(response).to be_successful

        customers = JSON.parse(response.body, symbolize_names: true)
        
        expect(customers[:data].count).to eq(5)
    end 
    it 'can see one customer by id' do
        customer = create(:customer)
        
        get "/api/v1/customers/#{customer.id}"
        
        expect(response).to be_successful
        
        raw_info = JSON.parse(response.body, symbolize_names: true)
        
        expect(raw_info[:data][:attributes][:first_name]).to eq(customer.first_name)
    end 
    it 'can find a single customers by request params' do
        customer_1 = create(:customer)
        customer_2 = create(:customer)

        get "/api/v1/customers/find?first_name=#{customer_1.first_name}"

        expect(response).to be_successful

        raw_info = JSON.parse(response.body, symbolize_names: true)

        expect(raw_info[:data][:id].to_i).to eq(customer_1.id)

        expect(raw_info[:data][:attributes][:first_name]).to eq(customer_1.first_name)
    end 

    it 'can find all customers by request params' do
       
        time = ("2020-01-27 10:53:59 UTC")

        time_2 = ("2020-01-25 10:53:59 UTC")

        customer_1 = create(:customer, created_at: time)
        customer_2 = create(:customer, created_at: time)
        # customer_3 = create(:customer, created_at: time_2)

        get "/api/v1/customers/find_all?created_at=#{time}"

        expect(response).to be_successful

        raw_info = JSON.parse(response.body, symbolize_names: true)

        expect(raw_info[:data].count).to eq(2)
    end 
    it 'can return a random customers' do
        customer_1 = create(:customer)
        customer_2 = create(:customer)
        customer_3 = create(:customer)

        get "/api/v1/customers/random"

        expect(response).to be_successful

        raw_info = JSON.parse(response.body, symbolize_names: true)
        
        expect(raw_info[:data][:attributes]).to_not be_empty
    end 
end 
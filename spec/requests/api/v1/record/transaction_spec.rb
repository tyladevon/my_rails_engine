require 'rails_helper'

describe 'Transactions record endpoints' do 
    it 'can see a list of transactions' do
        create_list(:transaction, 5)

        get '/api/v1/transactions'

        expect(response).to be_successful

        transactions = JSON.parse(response.body, symbolize_names: true)
        
        expect(transactions[:data].count).to eq(5)
    end 
    it 'can see one transaction by id' do
        transaction = create(:transaction)
        
        get "/api/v1/transactions/#{transaction.id}"
        
        expect(response).to be_successful
        
        raw_info = JSON.parse(response.body, symbolize_names: true)

        expect(raw_info[:data][:attributes][:id].to_i).to eq(transaction.id)
    end 
    it 'can find a single transactions by request params' do
        transaction_1 = create(:transaction)
        transaction_2 = create(:transaction)

        get "/api/v1/transactions/find?invoice_id=#{transaction_1.invoice_id}"

        expect(response).to be_successful

        raw_info = JSON.parse(response.body, symbolize_names: true)
    
        expect(raw_info[:data][:id]).to eq(transaction_1.id)

        expect(raw_info[:data][:attributes][:invoice_id]).to eq(transaction_1.invoice_id)
    end 

    it 'can find all transactions by request params' do
       
        time = ("2020-01-27 10:53:59 UTC")

        time_2 = ("2020-01-25 10:53:59 UTC")

        transaction_1 = create(:transaction, created_at: time)
        transaction_2 = create(:transaction, created_at: time)
        # transaction_3 = create(:transaction, created_at: time_2)

        get "/api/v1/transactions/find_all?created_at=#{time}"

        expect(response).to be_successful

        raw_info = JSON.parse(response.body, symbolize_names: true)

        expect(raw_info[:data].count).to eq(2)
    end 
    it 'can return a random transactions' do
        transaction_1 = create(:transaction)
        transaction_2 = create(:transaction)
        transaction_3 = create(:transaction)

        get "/api/v1/transactions/random"

        expect(response).to be_successful

        raw_info = JSON.parse(response.body, symbolize_names: true)
        
        expect(raw_info[:data][:attributes]).to_not be_empty
    end 
end 
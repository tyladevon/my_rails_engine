require 'rails_helper'

describe 'Invoice record endpoints' do 
    it 'can see a list of invoices' do
        create_list(:invoice, 5)

        get '/api/v1/invoices'

        expect(response).to be_successful

        invoices = JSON.parse(response.body, symbolize_names: true)
        
        expect(invoices[:data].count).to eq(5)
    end 
    it 'can see one invoice by id' do
        invoice = create(:invoice)
        
        get "/api/v1/invoices/#{invoice.id}"
        
        expect(response).to be_successful
        
        raw_info = JSON.parse(response.body, symbolize_names: true)

        expect(raw_info[:data][0][:attributes][:customer_id]).to eq("#{invoice.customer_id}".to_i)
    end 
    it 'can find a single invoices by request params' do
        invoice_1 = create(:invoice)
        invoice_2 = create(:invoice)

        get "/api/v1/invoices/find?merchant_id=#{invoice_1.merchant_id}"

        expect(response).to be_successful

        raw_info = JSON.parse(response.body, symbolize_names: true)

        expect(raw_info[:data][:id]).to eq("#{invoice_1.id}")

        expect(raw_info[:data][:attributes][:merchant_id]).to eq("#{invoice_1.merchant_id}".to_i)
    end 

    it 'can find all invoices by request params' do
       
        time = ("2020-01-27 10:53:59 UTC")

        time_2 = ("2020-01-25 10:53:59 UTC")

        invoice_1 = create(:invoice, created_at: time)
        invoice_2 = create(:invoice, created_at: time)
        # invoice_3 = create(:invoice, created_at: time_2)

        get "/api/v1/invoices/find_all?created_at=#{time}"

        expect(response).to be_successful

        raw_info = JSON.parse(response.body, symbolize_names: true)

        expect(raw_info[:data].count).to eq(2)
    end 
    it 'can return a random invoices' do
        invoice_1 = create(:invoice)
        invoice_2 = create(:invoice)
        invoice_3 = create(:invoice)

        get "/api/v1/invoices/random"

        expect(response).to be_successful

        raw_info = JSON.parse(response.body, symbolize_names: true)
        
        expect(raw_info[:data][:attributes]).to_not be_empty
    end 
end 
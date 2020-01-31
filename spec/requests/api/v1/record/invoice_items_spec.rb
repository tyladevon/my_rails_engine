require 'rails_helper'

describe 'Invoice Items record endpoints' do 
    it 'can see a list of invoice items' do
        create_list(:invoice_item, 5)

        get '/api/v1/invoice_items'

        expect(response).to be_successful

        invoice_items = JSON.parse(response.body, symbolize_names: true)
        
        expect(invoice_items[:data].count).to eq(5)
    end 
    it 'can see one Invoice Item by id' do
        invoice_item = create(:invoice_item)
        
        get "/api/v1/invoice_items/#{invoice_item.id}"
        
        expect(response).to be_successful
        
        raw_info = JSON.parse(response.body, symbolize_names: true)
        expect(raw_info[:data][:attributes][:item_id]).to eq("#{invoice_item.item_id}".to_i)
    end 
    it 'can find a single Invoice Item by request params' do
        invoice_item_1 = create(:invoice_item)
        invoice_item_2 = create(:invoice_item)
        
        get "/api/v1/invoice_items/find?item_id=#{invoice_item_1.item_id}"

        expect(response).to be_successful

        raw_info = JSON.parse(response.body, symbolize_names: true)
        
        expect(raw_info[:data][:id]).to eq("#{invoice_item_1.id}")

        expect(raw_info[:data][:attributes][:invoice_id]).to eq("#{invoice_item_1.invoice_id}".to_i)
    end 

    it 'can find all Invoice Items by request params' do
       
        time = ("2020-01-27 10:53:59 UTC")

        time_2 = ("2020-01-25 10:53:59 UTC")

        invoice_item_1 = create(:invoice_item, created_at: time)
        invoice_item_2 = create(:invoice_item, created_at: time)
        # invoice_item_3 = create(:invoice_item, created_at: time_2)

        get "/api/v1/invoice_items/find_all?created_at=#{time}"

        expect(response).to be_successful

        raw_info = JSON.parse(response.body, symbolize_names: true)

        expect(raw_info[:data].count).to eq(2)
    end 
    it 'can return a random Invoice Item' do
        invoice_item_1 = create(:invoice_item)
        invoice_item_2 = create(:invoice_item)
        invoice_item_3 = create(:invoice_item)

        get "/api/v1/invoice_items/random"

        expect(response).to be_successful

        raw_info = JSON.parse(response.body, symbolize_names: true)
        
        expect(raw_info[:data][:attributes]).to_not be_empty
    end 
end 
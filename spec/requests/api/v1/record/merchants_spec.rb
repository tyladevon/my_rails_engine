require 'rails_helper'

describe 'Merchants record endpoints' do 
    it 'can see a list of merchants' do
        create_list(:merchant, 5)

        get '/api/v1/merchants'

        expect(response).to be_successful

        merchants = JSON.parse(response.body, symbolize_names: true)
        expect(merchants[:data].count).to eq(5)
    end 
    it 'can see one merchant by id' do
        merchant = create(:merchant)
        
        get "/api/v1/merchants/#{merchant.id}"
        
        expect(response).to be_successful
        
        raw_info = JSON.parse(response.body, symbolize_names: true)

        expect(raw_info[:data][:attributes][:name]).to eq("#{merchant.name}")
    end 
    it 'can find merchant by request params' do
        merch_1 = create(:merchant)
        merch_2 = create(:merchant)

        get "/api/v1/merchants/find?name=#{merch_1.name}"

        expect(response).to be_successful

        raw_info = JSON.parse(response.body, symbolize_names: true)

        expect(raw_info[:data][:id]).to eq("#{merch_1.id}")

        expect(raw_info[:data][:attributes][:name]).to eq("#{merch_1.name}")
    end 
end 
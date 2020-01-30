require 'rails_helper'

describe "Merchants Items Endpoint" do
    it "can get a list of Merchant's Items" do 
        merchant = create(:merchant)
        create_list(:item, 5,
                merchant_id: merchant.id)

        get "/api/v1/merchants/#{merchant.id}/items"

        expect(response).to be_successful

        merchants = JSON.parse(response.body, symbolize_names: true)
        binding.pry

        expect(merchants[:data][0][:relationships][:items][:data].count).to eq(5)
    end 
end 
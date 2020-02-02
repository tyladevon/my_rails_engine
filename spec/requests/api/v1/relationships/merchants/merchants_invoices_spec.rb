require 'rails_helper'

describe "Merchants Invoices Endpoint" do
    it "can see a list of all invoices for that Merchant" do
        merchant = create(:merchant)
        create_list(:invoice, 3,
                merchant_id: merchant.id)

        get "/api/v1/merchants/#{merchant.id}/invoices"

        expect(response).to be_successful

        raw_info = JSON.parse(response.body, symbolize_names: true)

        expect(raw_info[:data].count).to eq(3)
        expect(raw_info[:data][0][:attributes][:merchant_id]).to eq(merchant.id)
    end 
end
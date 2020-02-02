require 'rails_helper'

describe "Invoices' Merchant Endpoint" do
    it "can get the associated Merchant for a specific Invoice" do 
        merchant = create(:merchant)
        customer = create(:customer)
        item_1 = create(:item, merchant_id: merchant.id)
        item_2 = create(:item, merchant_id: merchant.id)
        item_3 = create(:item, merchant_id: merchant.id)
        invoice = create(:invoice, merchant_id: merchant.id, customer_id: customer.id)
        invoice_item = create(:invoice_item, invoice_id: invoice.id, item_id:item_1.id)
        invoice_item = create(:invoice_item, invoice_id: invoice.id, item_id:item_2.id)
        invoice_item = create(:invoice_item, invoice_id: invoice.id, item_id:item_3.id)
        
        get "/api/v1/invoices/#{invoice.id}/merchant"

        expect(response).to be_successful

        merchant_data = JSON.parse(response.body, symbolize_names: true)

        expect(merchant_data[:data][:id].to_i).to eq(merchant.id)
        expect(merchant_data[:data][:attributes][:name]).to eq(merchant.name)
    end 
end 
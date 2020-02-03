require 'rails_helper'

describe "Item's Merchant Endpoint" do
    it 'can see the Merchant for the specific Items' do   
        merchant = create(:merchant)
        customer = create(:customer)
        invoice = create(:invoice, merchant_id: merchant.id, customer_id: customer.id)
        item = create(:item, merchant_id: merchant.id)
        item_2 = create(:item, merchant_id: merchant.id)
        invoice_2 = create(:invoice, merchant_id: merchant.id, customer_id: customer.id)
        invoice_item_1 = create(:invoice_item, invoice_id: invoice.id, item_id:item.id)
        invoice_item_2 = create(:invoice_item, invoice_id: invoice_2.id, item_id:item.id)
    

        get "/api/v1/items/#{item.id}/merchant"

        expect(response).to be_successful

        merchant_data = JSON.parse(response.body, symbolize_names: true)

        expect(merchant_data[:data][:id].to_i).to eq(merchant.id)
        expect(merchant_data[:data][:attributes][:name]).to eq(merchant.name)

    end 
end 
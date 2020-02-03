require 'rails_helper'

describe "Item's Invoice-items Endpoint" do
    it 'can see a list of invoice-items for the specific Item' do   
        merchant = create(:merchant)
        customer = create(:customer)
        invoice = create(:invoice, merchant_id: merchant.id, customer_id: customer.id)
        item = create(:item, merchant_id: merchant.id)
        invoice_2 = create(:invoice, merchant_id: merchant.id, customer_id: customer.id)
        invoice_item_1 = create(:invoice_item, invoice_id: invoice.id, item_id:item.id)
        invoice_item_2 = create(:invoice_item, invoice_id: invoice_2.id, item_id:item.id)
    

        get "/api/v1/items/#{item.id}/invoice_items"

        expect(response).to be_successful

        invoice_items_data = JSON.parse(response.body, symbolize_names: true)

        expect(invoice_items_data[:data][0][:id].to_i).to eq(invoice_item_1.id)
        expect(invoice_items_data[:data][1][:type]).to eq("invoice_item")

    end 
end 
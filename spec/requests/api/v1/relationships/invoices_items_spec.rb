require 'rails_helper'

describe "Invoices' Items Endpoint" do
    it "can get a list of Invoices' items" do 
        merchant = create(:merchant)
        customer = create(:customer)
        item_1 = create(:item, merchant_id: merchant.id)
        item_2 = create(:item, merchant_id: merchant.id)
        item_3 = create(:item, merchant_id: merchant.id)
        invoice = create(:invoice, merchant_id: merchant.id, customer_id: customer.id)
        invoice_item = create(:invoice_item, invoice_id: invoice.id, item_id:item_1.id)
        invoice_item = create(:invoice_item, invoice_id: invoice.id, item_id:item_2.id)
        invoice_item = create(:invoice_item, invoice_id: invoice.id, item_id:item_3.id)
        
        get "/api/v1/invoices/#{invoice.id}/items"

        expect(response).to be_successful

        items = JSON.parse(response.body, symbolize_names: true)
        expect(items[:data].count).to eq(3)
    end 
end 
require 'rails_helper'

describe "Invoices' Customer Endpoint" do
    it "can get the Customer for an Invoice" do 
        merchant = create(:merchant)
        customer = create(:customer)
        item_1 = create(:item, merchant_id: merchant.id)
        item_2 = create(:item, merchant_id: merchant.id)
        item_3 = create(:item, merchant_id: merchant.id)
        invoice = create(:invoice, merchant_id: merchant.id, customer_id: customer.id)
        invoice_item = create(:invoice_item, invoice_id: invoice.id, item_id:item_1.id)
        invoice_item = create(:invoice_item, invoice_id: invoice.id, item_id:item_2.id)
        invoice_item = create(:invoice_item, invoice_id: invoice.id, item_id:item_3.id)
        
        get "/api/v1/invoices/#{invoice.id}/customer"

        expect(response).to be_successful

        customer_data = JSON.parse(response.body, symbolize_names: true)
        expect(customer_data[:data][:id].to_i).to eq(customer.id)
        expect(customer_data[:data][:attributes][:first_name]).to eq(customer.first_name)
    end 
end 
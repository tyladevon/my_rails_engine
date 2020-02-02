require 'rails_helper'

describe "Invoice_items Item Endpoint" do
    it "can get a list of Invoices' invoice_items" do 
        invoice = create(:invoice)
        invoice_item = create(:invoice_item, invoice_id: invoice.id)
       
        get "/api/v1/invoice_items/#{invoice_item.id}/item"

        expect(response).to be_successful

        item = JSON.parse(response.body, symbolize_names: true)

        expect(item[:data][:id].to_i).to eq(invoice_item.item.id)
    end 
end 
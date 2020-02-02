require 'rails_helper'

describe "Invoice_items' Invoice Endpoint" do
    it "can get the associated Invoice for a specific Invoice Item" do 
        invoice = create(:invoice)
        invoice_item = create(:invoice_item, invoice_id: invoice.id)

        get "/api/v1/invoice_items/#{invoice_item.id}/invoice"

        expect(response).to be_successful

        invoice_data = JSON.parse(response.body, symbolize_names: true)

        expect(invoice_data[:data][:id].to_i).to eq(invoice.id)
    end 
end 
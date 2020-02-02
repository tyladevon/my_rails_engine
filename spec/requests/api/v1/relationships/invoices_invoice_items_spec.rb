require 'rails_helper'

describe "Invoices' Invoice_items Endpoint" do
    it "can get a list of Invoices' invoice_items" do 
        invoice = create(:invoice)
        create_list(:invoice_item, 5,
                invoice_id: invoice.id)

        get "/api/v1/invoices/#{invoice.id}/invoice_items"

        expect(response).to be_successful

        invoice_items = JSON.parse(response.body, symbolize_names: true)

        expect(invoice_items[:data].count).to eq(5)
    end 
end 
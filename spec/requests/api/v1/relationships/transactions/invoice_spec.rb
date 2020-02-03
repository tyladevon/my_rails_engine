require 'rails_helper'

describe "Transaction's Invoice Endpoint" do
    it "can get the invoice associated with a specific transaction" do 
        
        invoice = create(:invoice)
        transaction = create(:transaction, invoice_id: invoice.id)

        get "/api/v1/transactions/#{transaction.id}/invoice"
 
        expect(response).to be_successful

        invoice_data = JSON.parse(response.body, symbolize_names: true)

        expect(invoice_data[:data][:id].to_i).to eq(invoice.id)
        expect(invoice_data[:data][:type]).to eq("invoice")
    end 
end 
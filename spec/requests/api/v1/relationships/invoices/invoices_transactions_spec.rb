require 'rails_helper'

describe "Invoices' Transactions Endpoint" do
    it "can get a list of Invoices' transactions" do 
        invoice = create(:invoice)
        create_list(:transaction, 5,
                invoice_id: invoice.id)

        get "/api/v1/invoices/#{invoice.id}/transactions"

        expect(response).to be_successful

        transactions = JSON.parse(response.body, symbolize_names: true)

        expect(transactions[:data].count).to eq(5)
    end 
end 
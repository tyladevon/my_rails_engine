require 'rails_helper'

describe 'Merchants Most Revenue by quantity Endpoint' do 
    it 'can see result based on quantity input' do 
        customer = create(:customer)
        merchant = create(:merchant)
        merchant_2 = create(:merchant)

        item = create(:item, merchant_id: merchant.id, unit_price: 50.0) 
        invoice_1 = create(:invoice, merchant_id: merchant.id, customer_id: customer.id)
        invoice_item  = create(:invoice_item, item_id: item.id, invoice_id: invoice_1.id, unit_price: 50, quantity:1)
        transaction_1 = create(:transaction, invoice_id: invoice_1.id)
        
        item_2 = create(:item, merchant_id: merchant.id, unit_price: 20)
        invoice_2 = create(:invoice, merchant_id: merchant_2.id, customer_id: customer.id)
        invoice_item_2  = create(:invoice_item, item_id: item_2.id, invoice_id: invoice_2.id, unit_price: 20, quantity:2)
        transaction_2 = create(:transaction, invoice_id: invoice_2.id)

        get '/api/v1/merchants/most_revenue?quantity=3'

        expect(response).to be_successful
        most_revenue = JSON.parse(response.body, symbolize_names: true)
  
        expect(most_revenue[:data][0][:id].to_i).to eq(merchant.id)
        expect(most_revenue[:data][0][:attributes][:name]).to eq(merchant.name)
    end 
end 
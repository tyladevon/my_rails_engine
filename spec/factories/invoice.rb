FactoryBot.define do
    factory :invoice do
        association :customer 
        association :merchant
        association :invoice_items
        association :items
        association :transactions

        customer_id {customer.id}
        merchant_id {merchant.id}
        status {"shipped"}
    end 
end 

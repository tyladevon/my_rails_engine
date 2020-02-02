FactoryBot.define do
    factory :invoice do
        customer_id {customer.id}
        merchant_id {merchant.id}
        status {"shipped"}
        association :customer 
        association :merchant
    end 
end 

FactoryBot.define do
    factory :invoice do
        association :customer 
        association :merchant

        customer_id {customer.id}
        merchant_id {merchant.id}
        status {"shipped"}
    end 
end 

FactoryBot.define do
    factory :invoice_item do
        quantity { Faker::Number.number }
        unit_price { Faker::Commerce.price }
        association :item
        association :invoice
    end 
end 
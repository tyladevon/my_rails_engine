FactoryBot.define do
    factory :invoice_items do
        association :item
        association :invoice
    end 
end 
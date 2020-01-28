FactoryBot.define do
    factory :invoice_items do
        association :invoice_item
        association :invoice
    end 
end 
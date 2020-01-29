FactoryBot.define do
    factory :item do 
        name { Faker::Name }
        description { "This item's description"}
        unit_price { 12.99}

        association :merchant
    end 
end 
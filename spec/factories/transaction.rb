FactoryBot.define do
    factory :transaction do 
        invoice_id { Faker::Invoice}
        credit_card_number {Faker::Business.credit_card_number}
        credit_card_expiration { Faker::Business.credit_card_expiry_date}
        status {"success"}
    end 
end 
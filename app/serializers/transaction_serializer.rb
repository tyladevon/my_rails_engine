class TransactionSerializer
    include FastJsonapi::ObjectSerializer

    attributes :id, :invoice_id, :result

    belongs_to :invoice

    attribute :credit_card_number do |transaction|
        transaction.credit_card_number.to_s
    end 
end
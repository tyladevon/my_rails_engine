class InvoiceItemSerializer
    include FastJsonapi::ObjectSerializer

    attributes :id, :item_id, :invoice_id, :quantity

    belongs_to :invoice
    belongs_to :item

     attribute :unit_price do |item|
        item.unit_price.to_s 
    end 
end 
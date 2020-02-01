class ItemSerializer
    include FastJsonapi::ObjectSerializer

    attributes :id, :name, :description, :merchant_id

    belongs_to :merchant

    attribute :unit_price do |item|
        item.unit_price.to_s 
    end 

end
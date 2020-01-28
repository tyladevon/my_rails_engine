class Item < ApplicationRecord
  validates_presence_of :name,
                        :description,
                        :unit_price,
                        :merchant_id
  belongs_to :merchant 
end

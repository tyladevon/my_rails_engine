class Invoice < ApplicationRecord
  validates_presence_of :customer_id,
                        :merchant_id,
                        :status
  belongs_to :customer,
             :merchant

  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :transactions
end

class Merchant < ApplicationRecord
  validates_presence_of :name

  has_many :items
  has_many :invoices, through: :items

   def self.most_revenue(quantity)
        joins(invoices: [:invoice_items, :transactions]).
        select("merchants.*, sum(invoice_items.quantity * invoice_items.unit_price)as revenue").
        group(:id).
        where(transactions: {result: 'success'}).
        order('revenue desc').
        limit(quantity)
    end 
end

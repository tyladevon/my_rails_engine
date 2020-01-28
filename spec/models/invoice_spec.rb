require 'rails_helper'

describe Invoice, type: :model do
  describe 'Validations' do
    it {should validate_presence_of :customer_id}
    it {should validate_presence_of :merchant_id}
    it {should validate_presence_of :status}
  end
  describe 'Relationships' do
    it {should belong_to :customer}
    it {should belong_to :merchant}

    it {should have_many :invoice_items}
    it {should have_many :items}
    it {should have_many :transactions}
  end
end

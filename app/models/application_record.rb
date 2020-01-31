class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def change_unit_price
    self.unit_price = (self.unit_price.to_f / 100).to_s
  end

  def self.random
    find(pluck(:id).sample)
  end
end

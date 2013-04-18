class MoneyType < ActiveRecord::Base
  attr_accessible :name, :value

  has_many :quotations
  has_many :entry_document_details
  has_many :sell_prices
end

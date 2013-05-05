class MoneyType < ActiveRecord::Base
  attr_accessible :name, :value

  has_many :entry_document_details
  has_many :sell_prices
  has_many :quotation_details
  has_many :payments
end

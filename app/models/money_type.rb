class MoneyType < ActiveRecord::Base
  attr_accessible :name, :value

  has_many :quotations
end

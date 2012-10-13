class PriceType < ActiveRecord::Base
  attr_accessible :name

  validates :name, :presence => {:message => " no puede estar vacio"}

  has_many :sell_prices
end

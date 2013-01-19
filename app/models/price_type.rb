class PriceType < ActiveRecord::Base
  attr_accessible :name

  validates :name, :presence => {:message => " no puede estar vacio"}

  has_many :sell_prices

  def self.check_prices product_id
  	result = ""
  	prices = SellPrice.where(:product_id => product_id).all
  	prices.each do |p|
  		result = result + "<option value=#{p.sell_price}>" + p.price_type.name + " - " + p.sell_price.to_s + "</option>"
  	end
  	result
  end
end

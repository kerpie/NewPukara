class Store < ActiveRecord::Base
  attr_accessible :address, :name

  validates :name, :presence => {:message => " no puede estar vacio"}
  validates :address, :presence => {:message => " no puede estar vacio"}

  has_many :user
  has_many :stock
  has_many :numerations

  def underscore_name
  	name.gsub(" ", "_")
  end

end
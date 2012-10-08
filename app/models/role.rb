class Role < ActiveRecord::Base
  attr_accessible :description, :name

  validates :name, :presence => true
  validates :description, :presence => true

  has_and_belongs_to_many :users
end

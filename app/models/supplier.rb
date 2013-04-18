class Supplier < ActiveRecord::Base
  attr_accessible :address, :city, :contact_person, :country, :name, :phone, :mail, :other

  validates :name, :presence => {:message => " no puede estar vacio"}
  validates :address, :presence => {:message => " no puede estar vacio"}
  validates :contact_person, :presence => {:message => " no puede estar vacio"}
  validates :phone, :presence => {:message => " no puede estar vacio"}
  validates :mail, :presence => {:message => " no puede estar vacio"}
  
  has_many :entry_folders
end


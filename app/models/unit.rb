class Unit < ActiveRecord::Base
  attr_accessible :name, :value

  validates :name, :presence => {:message => " no puede estar vacio"}
  validates :value, :presence => {:message => " no puede estar vacio"}

  has_many :entry_document_detail, :dependent => :delete_all
  has_many :output_document_detail, :dependent => :delete_all
  has_many :quotation_details, :dependent => :delete_all
end

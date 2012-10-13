class DocumentType < ActiveRecord::Base
  attr_accessible :name

  validates :name, :presence => {:message => " no puede estar vacio"}

  has_many :entry_documents
  has_many :output_documents
end

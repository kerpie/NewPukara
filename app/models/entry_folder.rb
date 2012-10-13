class EntryFolder < ActiveRecord::Base
  attr_accessible :date, :folder_state_id, :supplier_id, :user_id, :entry_documents_attributes, :entry_document_details_attributes

  validates :date, :presence => {:message => " no puede estar vacio"}
  validates :folder_state_id, :presence => {:message => " no puede estar vacio"}
  validates :supplier_id, :presence => {:message => " no puede estar vacio"}
  validates :user_id, :presence => {:message => " no puede estar vacio"}

  has_many :entry_documents, :dependent => :destroy
  has_many :entry_document_details, :dependent => :destroy
  belongs_to :folder_state
  belongs_to :supplier
  belongs_to :user

  accepts_nested_attributes_for :entry_documents
  accepts_nested_attributes_for :entry_document_details

  def self.docs_by_supplier(quantity)
  	data = Array.new
  	docs = Hash.new
  	Supplier.all.each do |sup|
  		array = EntryFolder.where(:supplier_id => sup).limit(quantity.to_i).order('id desc').all
  		if !array.empty?
  			docs[sup] = array
  			data << docs 
  		end
  		docs = Hash.new
  	end
  	data
  end
end
class OutputFolder < ActiveRecord::Base
  attr_accessible 	:client_id, 
  					:date, 
  					:folder_state_id, 
  					:user_id, 
  					:output_documents_attributes, 
            :quotation_id,
  					:output_document_details_attributes

  validates :client_id, :presence => {:message => " no puede estar vacio"}
  validates :folder_state_id, :presence => {:message => " no puede estar vacio"}
  validates :user_id, :presence => {:message => " no puede estar vacio"}
  validates :date, :presence => {:message => " no puede estar vacio"}

  has_many :output_documents, :dependent => :delete_all
  has_many :output_document_details, :dependent => :delete_all
  belongs_to :quotation
  belongs_to :folder_state
  belongs_to :client
  belongs_to :user
  
  accepts_nested_attributes_for :output_documents
  accepts_nested_attributes_for :output_document_details
end

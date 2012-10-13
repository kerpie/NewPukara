class EntryDocument < ActiveRecord::Base
  attr_accessible :document_type_id, :entry_folder_id, :numeration

  belongs_to :entry_folder
  belongs_to :document_type
end

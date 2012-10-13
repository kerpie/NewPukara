class OutputDocument < ActiveRecord::Base
  attr_accessible :document_type_id, :numeration, :output_folder_id

  belongs_to :output_folder
  belongs_to :document_type
end

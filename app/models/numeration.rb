class Numeration < ActiveRecord::Base
  attr_accessible :current_number, :document_type_id, :initial_number, :store_id

  belongs_to :store
  belongs_to :document_type
end

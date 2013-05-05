class Payment < ActiveRecord::Base
  attr_accessible :money_received, :money_returned, :money_type_id, :quotation_id

  belongs_to :money_type
  belongs_to :quotation
end

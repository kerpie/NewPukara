class TemporalNumeration < ActiveRecord::Base
  attr_accessible :quotation_detail_id, :temporal_code

  validates :temporal_code, :presence => true 

  belongs_to :quotation_detail
end

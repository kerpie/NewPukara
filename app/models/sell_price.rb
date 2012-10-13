class SellPrice < ActiveRecord::Base
  attr_accessible :entry_document_detail_id, :price_type_id, :sell_price

  belongs_to :entry_document_detail
  belongs_to :price_type
end

class EntryCode < ActiveRecord::Base
  attr_accessible   :entry_document_detail_id, 
                    :generated_code, 
                    :original_code

  belongs_to :entry_document_detail

  def self.generateEntryCodes(folder)
  	folder.entry_document_details.each do |edd|
  		edd.quantity.times do |i|
  			entry_code = EntryCode.new
  			entry_code.entry_document_detail_id = edd.id

        #Generated Code
  			entry_code.generated_code = edd.id.to_s + "-" + i.to_s + "-" + edd.product.model.brand.name.to_s
  			entry_code.save
  		end
  	end
  end
end

class OutputCode < ActiveRecord::Base
  attr_accessible :output_document_detail_id, :registered_code

  belongs_to :output_document_detail

  def self.createOutputCodes(folder)
  	folder.output_document_details.each do |odd|
  		odd.quantity.times do |i|
  			output_code = OutputCode.new
  			output_code.output_document_detail_id = odd.id
  			output_code.save
  		end
  	end
  end
end

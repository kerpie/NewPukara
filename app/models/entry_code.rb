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
        entry_code.generated_code = initials(edd.product.model.brand.name) + date_number(edd.entry_folder.date) + four_numbers(edd.id)
        #entry_code.generated_code = edd.id.to_s + "-" + i.to_s + "-" + edd.product.model.brand.name.to_s
  			entry_code.save
  		end
  	end
  end
end

def initials(string)
  array = string.split
  result = ""
  2.times do |i|
    if array[i].nil?
      result = result + "0"
    else
      result = result + array[i][0]
    end
  end
  result
end

def date_number(date)
  day = date.day.to_s
  month = date.month.to_s
  if day.length < 2
    day = "0" + day
  end
  if month.length < 2
    month = "0" + month
  end
  return month + day
end

def four_numbers(id)
  new_id = id.to_s
  if new_id.length < 4
    this_number = 4 - new_id.length
    this_number.times do |i|
      new_id = "0" + new_id
    end
  else
    new_id = new_id[4]
  end
  return new_id
end
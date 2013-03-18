class EntryCodeController < ApplicationController

  def search
  	respond_to do |format|
  		format.html
  	end
  end

  def result

  	doc_type = DocumentType.find(params[:doc_type])
  	@result = EntryDocument.where(:numeration => params[:numbers], :document_type_id => doc_type).all

    supplier = Supplier.find(params[:supplier])

    @response = []
    @result.each do |ed|
      if ed.entry_folder.supplier == supplier
        @response << ed.entry_folder
      end
    end

  	respond_to do |format|
		  format.js 
  	end
  end

  def register
    doc = EntryDocument.find(params[:doc_register_id])
    @folder = doc.entry_folder
    respond_to do |format|
      format.html
    end
  end

  def save_codes
    folder = EntryFolder.find(params[:folder_id])
    folder.entry_document_details.each do |dd|
      dd.entry_codes.each do |ec|
        new_ec = EntryCode.find(ec.id)
        new_ec.original_code = params["code_"+ec.id.to_s]
        new_ec.save
      end
    end
    respond_to do |format|
      format.js
    end
  end

  def show
    @folder = EntryFolder.find(params[:folder_id])
    respond_to do |format|
      format.html 
    end
  end
end

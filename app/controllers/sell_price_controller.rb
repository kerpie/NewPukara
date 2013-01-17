class SellPriceController < ApplicationController
  
  def search
    respond_to do |format|
      format.html
    end
  end

  def result
    doc_type = DocumentType.find(params[:doc_type])
    @result = EntryDocument.where(:numeration => params[:numbers], :document_type_id => doc_type).all
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

  def save_price
    folder = EntryFolder.find(params[:folder])
    folder.entry_document_details.each do |edd|
      PriceType.all.each do |pt|
        price = SellPrice.where(:entry_document_detail_id => edd, :price_type_id => pt).first
        if price.nil?
          price = SellPrice.new
        end
        price.entry_document_detail_id = edd.id
        price.price_type_id = pt.id 
        price.sell_price = params[edd.id.to_s+"-"+pt.id.to_s]
        price.save
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

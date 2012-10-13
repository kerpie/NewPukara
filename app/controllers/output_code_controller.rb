class OutputCodeController < ApplicationController
  
  def search
    respond_to do |format|
      format.html
    end
  end

  def result

    doc_type = DocumentType.find(params[:doc_type])
    @result = OutputDocument.where(:numeration => params[:numbers], :document_type_id => doc_type).all

    respond_to do |format|
      format.js 
    end
  end

  def register
    doc = OutputDocument.find(params[:doc_register_id])
    @folder = doc.output_folder
    respond_to do |format|
      format.html
    end
  end

  def save_codes
    folder = OutputFolder.find(params[:folder_id])
    folder.output_document_details.each do |dd|
      dd.output_codes.each do |oc|
        oc.output_document_detail_id = dd
        oc.registered_code = params["code_"+oc.id.to_s]
        oc.save
      end
    end
    respond_to do |format|
      format.js
    end
  end

  def show
    @folder = OutputFolder.find(params[:folder_id])
    respond_to do |format|
      format.html 
    end
  end
end

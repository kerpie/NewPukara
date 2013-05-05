class OutputCodeController < ApplicationController
  
  def search
    respond_to do |format|
      format.html
    end
  end

  def result

    q = Quotation.find_by_code(params[:numbers].strip)
    @result = nil
    unless q.nil?
      unless q.output_folder.nil?
        @result = q.output_folder
      end
    end

    #@result = OutputDocument.where(:numeration => params[:numbers], :document_type_id => doc_type).all

    respond_to do |format|
      format.js 
    end
  end

  def register
    @folder = OutputFolder.find(params[:doc_register_id])
    respond_to do |format|
      format.html
    end
  end

  def save_codes
    folder = OutputFolder.find(params[:folder_id])
    folder.output_document_details.each do |dd|
      dd.output_codes.each do |oc|
        oc.output_document_detail_id = dd.id
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

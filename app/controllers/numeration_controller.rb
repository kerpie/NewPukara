class NumerationController < ApplicationController
  def index
  	
  	@numerations = {}

  	Store.all.each do |store|
  		tmp = Numeration.where(:store_id => store).all
  		unless tmp.nil?
  			@numerations[store] = tmp
  		end
  	end

  	respond_to do |format|
  		format.html
  	end
  end

  def update

    dt_id = params[:dt_id]
    st_id = params[:st_id]
    initial_number = params[:initial_number]
    current_number = params[:current_number]

    @num = Numeration.where(:store_id => st_id, :document_type_id => dt_id).first
    @num.initial_number = initial_number
    @num.current_number = current_number
    @num.save

  	respond_to do |format|
  		format.js
  	end
  end

  def reborn

    Store.all.each do |store|
      DocumentType.all.each do |dt|
        num = Numeration.where(:store_id => store, :document_type_id => dt).first
        if num.nil?
          num = Numeration.new
          num.document_type_id = dt.id
          num.store_id = store.id
          num.current_number = 0
          num.initial_number = 0
          num.save
        end
      end
    end
    
    respond_to do |format|
      format.js
    end
  end
end

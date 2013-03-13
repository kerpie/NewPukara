class QuotationsController < ApplicationController
  # GET /quotations
  # GET /quotations.json
  def index
    @quotations = Quotation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @quotations }
    end
  end

  # GET /quotations/1
  # GET /quotations/1.json
  def show
    @quotation = Quotation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @quotation }
    end
  end

  # GET /quotations/new
  # GET /quotations/new.json
  def new
    @quotation = Quotation.new
    3.times do 
      @quotation.quotation_details.build
    end
    @clients = Client.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @quotation }
    end
  end

  # GET /quotations/1/edit
  def edit
    @quotation = Quotation.find(params[:id])
  end

  # POST /quotations
  # POST /quotations.json
  def create
    @quotation = Quotation.new(params[:quotation])

    respond_to do |format|
      if @quotation.save
        format.html { redirect_to @quotation, notice: 'Quotation was successfully created.' }
        format.json { render json: @quotation, status: :created, location: @quotation }
      else
        format.html { render action: "new" }
        format.json { render json: @quotation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /quotations/1
  # PUT /quotations/1.json
  def update
    @quotation = Quotation.find(params[:id])

    respond_to do |format|
      if @quotation.update_attributes(params[:quotation])
        format.html { redirect_to @quotation, notice: 'Quotation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @quotation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quotations/1
  # DELETE /quotations/1.json
  def destroy
    @quotation = Quotation.find(params[:id])
    @quotation.destroy

    respond_to do |format|
      format.html { redirect_to quotations_url }
      format.json { head :no_content }
    end
  end

  def search_index
    respond_to do |format|
      format.html
    end
  end

  def search

    code = params[:code]
    @q = Quotation.find_by_code(code)
    
    respond_to do |format|
      format.js
    end
  end

  def search_product

    temp = params[:qp_search_input].split(" ")
    @response = []
    if temp.length > 1
      pt = temp[0]
      b = temp[1]
      pm = temp[2]

      b = Brand.where("name like ?", "%"+b+"%").first
      pt = ProductType.where("name like ?", "%"+pt+"%").first
      pm = ParentModel.where("name like ?", "%"+pm+"%").first

      pm.model_types.each do |mt|
        tmp = Model.where(:model_type_id => mt, :brand_id => b)
        tmp.each do |m|
          unless m.product.nil?
            @response << m.product
          end
        end
      end
    else
      m = Model.where("name like ?", "%"+ temp[0]+ "%").first
      unless m.nil?
        unless m.product.nil?
          @response[0] = m.product
        end
      end
    end


    respond_to do |format|
      format.js
    end
  end
end

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

    o =  [('a'..'z'),('A'..'Z')].map{|i| i.to_a}.flatten
    string  =  (0...6).map{ o[rand(o.length)] }.join
    @quotation.code = string 

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

    @quotations = Quotation.last(10)

    respond_to do |format|
      format.html
    end
  end

  def search

    code = params[:code].strip
    @q = Quotation.find_by_code(code)
    
    respond_to do |format|
      format.js
    end
  end

  def search_product

    text = params[:qp_search_input].upcase
    @response = []

    Product.all.each do |product|
      unless product.full_name.match(text).nil?
        @response << product
      end
    end
=begin
    if temp.length == 3
      pt = temp[0].upcase
      b = temp[1].upcase
      pm = temp[2].upcase

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
    elsif temp.length == 2
      pt = temp[0].upcase
      b = temp[1].upcase

      b = Brand.where("name like ?", "%"+b+"%").first
      pt = ProductType.where("name like ?", "%"+pt+"%").first

      tmp = Model.where(brand_id: b).all

      tmp.each do |m|
        unless m.product.nil?
          @response << m.product 
        end
      end

    else
      m = Model.where("name like ?", "%"+ temp[0].upcase + "%").all
      m.each do |model|
        unless model.product.nil?
          @response << model.product
        end
      end
    end
=end

    respond_to do |format|
      format.js
    end
  end

  def search_stock

    user_id = params[:user_id]
    p_id = params[:product_id]

    store = User.find(user_id).store

    @product = Product.find(p_id)
    @stock = Stock.where(product_id: p_id).all
    @price = SellPrice.where(product_id: p_id).all

    respond_to do |format|
      format.js
    end
  end

  def pay_quotation

    q = Quotation.find(params[:q_id])

    q.money_expected = params[:money_expected].to_f
    q.money_received = params[:money_received].to_f
    q.money_returned = params[:money_returned].to_f
    q.payment_status = true

    documents = []
    DocumentType.all.each do |dt|
      unless params[dt.id.to_s].nil?
        documents << dt
      end
    end

    #Create OutputFolder
    @of = OutputFolder.new
    @of.client = q.client
    @of.date = Time.now
    @of.folder_state = FolderState.last
    @of.user = q.user
    @of.quotation = q
    @of.save 

    #Create OutputDocument
    documents.each do |d|
      od = OutputDocument.new
      od.numeration = "1000"
      od.document_type = d
      od.output_folder = @of
      od.save
    end

    #Create OuputDocumentDetail
    q.quotation_details.each do |qd|
      odd = OutputDocumentDetail.new
      odd.output_folder = @of
      odd.product = qd.product
      odd.sell_price = qd.sell_price
      odd.quantity = qd.quantity
      odd.unit = qd.unit
      odd.save
    end

    Stock.reduce_stock(@of)

    respond_to do |format|
      if q.save
        OutputCode.createOutputCodes(@of)
        format.js
      else
        format.js
      end
    end
  end

  def auth_user

    user_id = params[:user_to_auth]
    small_code = params[:small_code]

    user = User.find(user_id)
    @can_continue = false

    if(user.small_code.to_s == small_code)
      @can_continue = true
    else
      @can_continue = false
    end

    respond_to do |format|
      format.js
    end
  end

  def create_client
    client = Client.new
    client.save
    
    respond_to do |format|
      format.js
    end
  end

  def receive_message

    Store.all.each do |store|
      p = "message_to_store_" + store.name.gsub(" ","_")
      message_received = params[p]
      unless message_received.empty?
        notification = Notification.new
        notification.message = message_received
        notification.user_id = params[:user_id]
        notification.store_id = store.id 
        notification.save 
      end
    end
    

    respond_to do |format|
      format.js
    end
  end
end

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

    total = 0
    @quotation.quotation_details.each do |qd|
      total = total + qd.sell_price * qd.quantity * qd.money_value 
    end

    @quotation_value = {}
    MoneyType.all.each do |mt|
      @quotation_value[mt.name] = [(total/mt.value).round(2), mt.value]
    end

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

    #Code for quotation
    @quotation.code = Time.now.to_i.to_s[5,10] 
    @quotation.payment_status = false

    total = 0
    @quotation.quotation_details.each do |qd|
      total = total + (qd.sell_price * qd.money_value)
    end

    @quotation.money_expected = total

    respond_to do |format|
      if @quotation.save
        format.html { redirect_to quotation_temporal_codes_path(@quotation.id), notice: 'Quotation was successfully created.' }
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

    @quotation = Quotation.find(params[:q_id])

    #Todo el verdadero trabajo va aqui GO GO GO!

    docs = []
    @quotation.docs_to_generate.each do |doc|
      docs << DocumentType.find(params[doc.name.gsub(" ","_")])
    end

    @temporal_numerations_complete = false

    @quotation.quotation_details.each do |qd|
      counts = true
      qd.temporal_numerations.each do |tn|
        if tn.temporal_code.empty?
          counts = false
          break
        end
      end
      if counts
        if qd.quantity == qd.temporal_numerations.count
          @temporal_numerations_complete = true
        end
      end
    end

    @of = @quotation.approve_payment(params[:soles], params[:dollars], docs, @temporal_numerations_complete)
    unless @of.nil?
      @quotation.payment_status = true
      @quotation.save
    end
    
    respond_to do |format|
      format.js
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

    user = User.find(params[:user_id])

    Store.all.each do |store|
      unless user.store == store
        p = "message_to_store_" + store.name.gsub(" ","_")
        message_received = params[p]
        unless message_received.empty?
          notification = Notification.new
          notification.message = message_received
          notification.user_id = user.id 
          notification.store_id = store.id 
          notification.save 
        end
      end
    end

    respond_to do |format|
      format.js
    end
  end

  #New Quotation create - full ajax
  def new_create
    respond_to do |format|
      format.html
    end
  end

  def new_client_search

    text = params[:text_to_search].upcase
    @clients = []

    Client.all.each do |client|
      unless client.search_text.match(text).nil?
        @clients << client
      end
    end

    respond_to do |format|
      format.js
    end
  end

  def new_product_search

    text = params[:text_to_search].upcase
    @products = []

    Product.all.each do |product|
      unless product.full_name.match(text).nil?
        @products << product
      end
    end

    respond_to do |format|
      format.js
    end
  end

  def new_register_client

    @client = Client.new
    
    @client.name = params[:client_name].upcase
    @client.phone = params[:client_phone].upcase
    @client.mobile = params[:client_mobile].upcase
    @client.mail = params[:client_mail].upcase
    @client.identification_number = params[:client_identification_number]
    @client.client_type_id = params[:client_type]

    respond_to do |format|
      if @client.save
        format.js
      else
        format.js { render "error.js" }
      end
    end
  end

  def stupid_calculation

    @total = params[:number_to_iterate]
    total_value = 0.0

    @total.to_i.times do |i|
      money_type = "money_type_" + (i+1).to_s
      value = "value_" + (i+1).to_s
      money = MoneyType.find(params[money_type])
      total_value = total_value + (money.value * params[value].to_f)
    end

    @response = {}
    MoneyType.all.each do |money|
      @response[money.name] = (total_value/money.value)
    end

    respond_to do |format|
      format.js
    end
  end

  def temporal_codes
  
    @q = Quotation.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def save_temporal_codes

    quotation = Quotation.find(params[:quotation_id])

    quotation.quotation_details.each do |qd|
      temporals = TemporalNumeration.where(:quotation_detail_id => qd.id).all
      if temporals.count > 0
        i = 0
        temporals.each do |t|
          t.temporal_code = params["#{qd.id}_#{i}"].strip
          t.save
          i = i + 1
        end
        (qd.quantity - i).times do |k|
          t = TemporalNumeration.new
          t.quotation_detail_id = qd.id
          unless params["#{qd.id}_#{i}"].strip.empty?
            t.temporal_code = params["#{qd.id}_#{i+k}"].strip
            t.save
          end
        end
      else
        qd.quantity.times do |i|
          t = TemporalNumeration.new
          t.quotation_detail_id = qd.id
          #unless params["#{qd.id}_#{i}"].strip.empty?
            t.temporal_code = params["#{qd.id}_#{i}"].strip
            t.save
          #end
        end
      end
    end

    respond_to do |format|
      format.js
    end
  end

  def another_stupid_calculation

    q = Quotation.find(params[:q_id])

    @response_hash = q.change(params[:money_received_in_soles].to_f, params[:money_received_in_dollars].to_f)
    @docs_to_generate = q.docs_to_generate

    respond_to do |format|
      format.js
    end
  end
end
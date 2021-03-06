class ProductsController < ApplicationController
  
  # GET /products
  # GET /products.json
  def index
    #@products = Product.all
    #@products = Product.first(30)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  def new_search

    text = params[:search_param].upcase
    @products = []

    Product.all.each do |product|
      unless product.full_name.match(text).nil?
        @products << product
      end
    end

    @total = @products.count

    respond_to do |format|
      format.js
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'El producto fue creado correctamente.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Los datos se actualizaron correctamente' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  def model_changer
    brand = Brand.where(:name => params[:brand_id].upcase)
    model_type = ModelType.find(params[:model_type_id])

    @result = Model.where(:brand_id => brand, :model_type_id => model_type)
    respond_to do |format|
      format.js
    end
  end

  def search
    @type = ProductType.find(params[:product_search_type])
    parent_model = ParentModel.find(params[:product_search_parent_model])
    @model_type = ModelType.where(:parent_model_id => parent_model)

    authorize! :search, Product.new
    respond_to do |format|
      format.js
    end
  end

  def second_search
    @type = ProductType.find(params[:product_search_type])
    model_type = ModelType.find(params[:product_search_model_type])
    brand = Brand.find(params[:product_search_brand])

    @model = Model.where(:model_type_id => model_type, :brand_id => brand).all
    respond_to do |format|
      format.js
    end
  end

  def last_search
    type = ProductType.find(params[:product_search_type])
    model = Model.find(params[:product_search_model])

    @product = Product.where(:model_id => model, :product_type_id => type).first

    respond_to do |format|
      format.js
    end
  end

  def sell_price

    @product = Product.find(params[:id])
    @sell_prices = SellPrice.where(:product_id => @product)

    respond_to do |format|
      format.html
    end
  end

  def register_sell_price

    PriceType.all.each do |pt|
      sp = SellPrice.where(:product_id => params[:prod_id], :price_type_id => pt).first    
      if sp.nil?
        sp = SellPrice.new
        sp.product_id = params[:prod_id]
        sp.price_type_id = pt.id
      end     
      sp.money_type_id = params["select_#{pt.name}"]
      sp.sell_price = params[pt.name]
      sp.save
    end

    @response = SellPrice.where(:product_id => params[:prod_id])

    respond_to do |format|
      format.js
    end
  end

  def search_for_stock

    mod = params[:modelo]
    @products = Array.new
    
    models = Model.where(["name like ?", "%#{mod}%"])
    models.each do |model|
      product = Product.where(:model_id => model).first
      unless product.nil?
        @products << product
      end
    end

    @response = Hash.new
    
    @products.each do |product|
      stock = Stock.where(:product_id => product)
      unless stock.empty?
        @response[product] = stock
      end
    end

    respond_to do |format|
      format.js
    end
  end

  def stock_for_product

    @product = Product.find(params[:id])
    @stock = Stock.where(product_id: @product).all

    respond_to do |format|
      format.html
    end
  end
end
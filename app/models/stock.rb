class Stock < ActiveRecord::Base
  attr_accessible :product_id, :quantity, :store_id

  belongs_to :product
  belongs_to :store

  def Stock.check_stock(productId, storeId)
  	product = Product.find(productId)
  	store = Store.find(storeId)

  	stock = Stock.where(:product_id => product, :store_id => store)
  end

  def self.prepare_to_update(folder)
  	user = folder.user
  	folder.entry_document_details.each do |edd|
  		stock = (Stock.check_stock(edd.product.id, user.store.id)).first
  		stock.quantity = stock.quantity - (edd.quantity * edd.unit.value)
  		stock.save
  	end
  end

  def self.add_stock(folder)
  	user = folder.user
  	previous_stock = 0
	
  	folder.entry_document_details.each do |edd|
  		stock = (Stock.check_stock(edd.product.id, user.store.id)).first
  		if stock.nil?
  			stock = Stock.new
  			stock.product_id = edd.product.id
  			stock.store_id = user.store.id
  		else
  			previous_stock = stock.quantity
  		end
  		stock.quantity = previous_stock + (edd.quantity * edd.unit.value)
  		stock.save
  	end
  end

  def self.reduce_stock(folder)
    user = folder.user
    folder.output_document_details.each do |odd|
      stock = (Stock.check_stock(odd.product.id, user.store_id)).first
      q = stock.quantity
      stock.quantity = q - odd.quantity
      stock.save
    end
  end

  def self.add_output_stock(folder)
    user = folder.user
    previous_stock = 0
  
    folder.output_document_details.each do |odd|
      stock = (Stock.check_stock(odd.product.id, user.store.id)).first
      if stock.nil?
        stock = Stock.new
        stock.product_id = odd.product.id
        stock.store_id = user.store.id
      else
        previous_stock = stock.quantity
      end
      stock.quantity = previous_stock + (odd.quantity * odd.unit.value)
      stock.save
    end
  end

end
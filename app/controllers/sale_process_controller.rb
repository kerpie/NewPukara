class SaleProcessController < ApplicationController
  def index

  	@clients = Client.all
  	@products = Product.all

  	respond_to do |format|
  		format.html
  	end
  end
end

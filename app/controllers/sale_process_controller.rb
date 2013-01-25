class SaleProcessController < ApplicationController
  def index

  	@clients = Client.all
  	@products = Product.all

  	respond_to do |format|
  		format.html
  	end
  end

  def new_client

  	@client = Client.new 

  	@client.name = params[:name]
  	@client.address = params[:address]
  	@client.client_type_id = params[:client_type_id]
  	@client.identification_number = params[:identification_number]

  	respond_to do |format|
  		if @client.save
  			format.js
  		else
  			format.js {render 'fail_create_client.js.erb'}
  		end
  	end
  	
  end
end

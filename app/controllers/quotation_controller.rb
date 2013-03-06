class QuotationController < ApplicationController

  def index
    respond_to do |format|
      format.html
    end
  end

  def search
    @q = Quotation.find_by_code(params[:code])
    respond_to do |format|
      format.js
    end
  end

  def show

    @q = Quotation.find(params[:id])

    respond_to do |format|    
      format.html
    end
  end

  def update
  end

  def new
  end

  def create
  end

  def pay_quotation

    @q = Quotation.find(params[:id])
    @q.money_received = params[:money_received]
    @q.money_returned = params[:money_returned]
    @q.money_expected = params[:money_expected]
    @q.money_type_id = params[:money_type_id]
    @q.save
    
    respond_to do |format|
      format.js
    end
  end

  def client_search

    @name = params[:name]

    respond_to do |format|
      format.js
    end
  end
end

class MoneyTypeController < ApplicationController
  
  def index
    @mt = MoneyType.all 
    authorize! :read, @mt
    respond_to do |f|
      f.html
    end
  end

  def create
    @new_mt = MoneyType.new
    @new_mt.name = params[:name]
    @new_mt.value = params[:value]
    respond_to do |f|
      if @new_mt.save
        f.js
      else
        f.js {render 'fail_create.js.erb'}
      end
    end
  end

  def destroy
    @del_mt = MoneyType.find(params[:mt_id])
    @del_mt.destroy

    respond_to do |f|
      f.js
    end
  end

  def update
    @up_mt = MoneyType.find(params[:mtupdate_id])
    @up_mt.name = params[:up_name]
    @up_mt.value = params[:up_value]
    respond_to do |f|
      if @up_mt.save
        f.js
      else
        f.js {render 'fail_update.js.erb'}
      end
    end
  end
end

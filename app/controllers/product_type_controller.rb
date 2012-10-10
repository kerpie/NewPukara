class ProductTypeController < ApplicationController

  def index
  	@pt = ProductType.all 
    authorize! :read, @pt
    respond_to do |f|
      f.html
    end
  end

  def create
  	@new_pt = ProductType.new
    @new_pt.name = params[:name]
    authorize! :create, @new_pt
    respond_to do |f|
      if @new_pt.save
        f.js
      else
        f.js {render 'fail_create.js.erb'}
      end
    end
  end

  def destroy
  	@del_pt = ProductType.find(params[:pt_id])
    @del_pt.destroy

    respond_to do |f|
      f.js
    end
  end

  def update
  	@up_pt = ProductType.find(params[:pt_id])
    @up_pt.name = params[:new_value]
    authorize! :update, @up_pt
    respond_to do |f|
      if @up_pt.save
        f.js
      else
        f.js {render 'fail_update.js.erb'}
      end
    end
  end
end
class BrandController < ApplicationController
   def index
    @brands = Brand.all 
    authorize! :read, Brand.new
    respond_to do |f|
      f.html
    end
  end

  def create
    @new_brand = Brand.new
    @new_brand.name = params[:name].upcase
    authorize! :create, Brand.new 
    respond_to do |f|
      if @new_brand.save
        f.js
      else
        f.js {render 'fail_create.js.erb'}
      end
    end
  end

  def destroy
    @del_brand = Brand.find(params[:brand_id])
    @del_brand.destroy
    respond_to do |f|
      f.js
    end
  end

  def update
    @up_brand = Brand.find(params[:brand_id])
    @up_brand.name = params[:new_value].upcase
    authorize! :update, Brand.new
    respond_to do |f|
      if @up_brand.save
        f.js
      else
        f.js {render 'fail_update.js.erb'}
      end
    end
  end

  def create_model
    @new_model = Model.new
    @new_model.brand_id = params[:brand_id]
    @new_model.model_type_id = params[:model_type_id]
    @new_model.name = params[:name].upcase
    authorize! :create, Model.new 
    respond_to do |f|
      if @new_model.save
        f.js
      else
        f.js {render 'fail_create_model.js.erb'}
      end
    end
  end

  def update_model
    @up_model = Model.find(params[:model_id])
    @up_model.name = params[:new_value].upcase
    authorize! :update, Model.new
    respond_to do |f|
      if @up_model.save
        f.js
      else
        f.js {render 'fail_update_model.js.erb'}
      end
    end
  end
  def destroy_model
    @del_model = Model.find(params[:model_id])
    @del_model.destroy
    respond_to do |format|
      format.js
    end
  end
end
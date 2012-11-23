class BrandController < ApplicationController
   
   def index
    hash = Hash.new
    second_hash = Hash.new
    @third_hash = Hash.new

    Brand.all.each do |brand|
      ParentModel.all.each do |pm|
        pm.model_types.each do |mt|
          models = Model.where(:brand_id => brand, :model_type_id => mt).all
          if models.count > 0
            hash[mt] = models
          end
        end
        second_hash[pm] = hash
        hash = Hash.new
      end
      @third_hash[brand] = second_hash  
      second_hash = Hash.new
    end

    authorize! :read, Brand.new
    respond_to do |f|
      f.html
    end
  end

  #ParentModel index
  def parent_model_index
    @parent_model = ParentModel.all
    respond_to do |f|
      f.js
    end
  end

  #ModelType index
  def model_type_index
    @model_type = ModelType.all
    respond_to do |f|
      f.js
    end
  end

  def create
    @new_brand = Brand.new
    @new_brand.name = unless params[:name].nil? 
                        params[:name].upcase
                      end
    authorize! :create, Brand.new 
    respond_to do |f|
      if @new_brand.save
        f.js
      else
        f.js {render 'fail_create.js.erb'}
      end
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

  def create_model_one
    @model_types = ModelType.where(:parent_model_id => params[:parent])

    respond_to do |f|
      f.js
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

  def create_class
    @new_class = ParentModel.new
    @new_class.name = unless params[:name].nil? 
                        params[:name].upcase
                      end
    respond_to do |f|
      if @new_class.save
        f.js
      else
        f.js {render 'fail_create.js.erb'}
      end
    end
  end

  def destroy_class
    @del_class = ParentModel.find(params[:class_id])
    @del_class.destroy
    respond_to do |f|
      f.js
    end
  end

  def create_model_type
    @new_model_type = ModelType.new
    @new_model_type.parent_model_id = unless params[:parent].nil?
                                        params[:parent].upcase
                                      end
    @new_model_type.name = unless params[:name].nil? 
                        params[:name].upcase
                      end
    respond_to do |f|
      if @new_model_type.save
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

  def destroy_model
    @del_model = Model.find(params[:model_id])
    @del_model.destroy
    respond_to do |format|
      format.js
    end
  end

end
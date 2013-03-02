class BrandController < ApplicationController
   
   def index
    hash = Hash.new
    second_hash = Hash.new
    @third_hash = Hash.new

    Brand.order('name ASC').first(10).each do |brand|
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

    def create
    @create = Brand.new
    @create.name = unless params[:name].nil? 
                        params[:name].upcase.strip
                      end
    authorize! :create, Brand.new 
    respond_to do |f|
      if @create.save
        f.js
      else
        f.js {render 'fail_create.js.erb'}
      end
    end
  end

  #ParentModel index
  def parent_model_index
    @parent_model = ParentModel.all
    respond_to do |f|
      f.js
    end
  end

  def create_class
    @create = ParentModel.new
    @create.name = unless params[:name].nil? 
                        params[:name].upcase.strip
                      end
    respond_to do |f|
      if @create.save
        f.js
      else
        f.js {render 'fail_create.js.erb'}
      end
    end
  end

  def parent_model_destroy
    @parent_model = ParentModel.find(params[:pm_id])
    @parent_model.destroy
    respond_to do |f|
      f.js
    end
  end

  def parent_model_update
    @parent_model = ParentModel.find(params[:pm_id])
    @parent_model.name = params[:new_name].upcase.strip
    
    respond_to do |f|
      if @parent_model.save
        f.js
      else
        f.js {render 'fail_create.js.erb'}
      end
    end
  end

  #ModelType index
  def model_type_index
    @model_type = ParentModel.all
    respond_to do |f|
      f.js
    end
  end

  def model_type_destroy
    @model_type = ModelType.find(params[:mt_id])
    @model_type.destroy
    respond_to do |f|
      f.js
    end
  end

  def model_type_update
    @model_type = ModelType.find(params[:mt_id])
    @model_type.name =  unless params[:new_name].nil? 
                          params[:new_name].upcase.strip
                        end
    @model_type.save
    respond_to do |f|
      f.js
    end
  end

  def update
    @up_brand = Brand.find(params[:brand_id])
    @up_brand.name = params[:new_value].upcase.strip
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
    @create = Model.new
    @create.brand_id = params[:brand_id]
    @create.model_type_id = params[:model_type_id]
    @create.name = params[:name].upcase.strip
    authorize! :create, Model.new 
    respond_to do |f|
      if @create.save
        f.js
      else
        f.js {render 'fail_create_model.js.erb'}
      end
    end
  end

  def update_model
    @up_model = Model.find(params[:model_id])
    @up_model.name = params[:new_value].upcase.strip
    
    authorize! :update, Model.new
    respond_to do |f|
      if @up_model.save
        f.js
      else
        f.js {render 'fail_update_model.js.erb'}
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
    @create = ModelType.new
    @create.parent_model_id = params[:parent].upcase
    @create.name = params[:name].upcase.strip
    respond_to do |f|
      if @create.save
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
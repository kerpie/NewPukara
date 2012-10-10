class ModelTypeController < ApplicationController
  def index
    @mt = ModelType.all 
    authorize! :read, @mt
    respond_to do |f|
      f.html
    end
  end

  def create
    @new_mt = ModelType.new
    @new_mt.name = params[:name]
    authorize! :create, @new_mt
    respond_to do |f|
      if @new_mt.save
        f.js
      else
        f.js {render 'fail_create.js.erb'}
      end
    end
  end

  def destroy
    @del_mt = ModelType.find(params[:mt_id])
    @del_mt.destroy

    respond_to do |f|
      f.js
    end
  end

  def update
    @up_mt = ModelType.find(params[:mt_id])
    @up_mt.name = params[:new_value]
    authorize! :update, @up_mt
    respond_to do |f|
      if @up_mt.save
        f.js
      else
        f.js {render 'fail_update.js.erb'}
      end
    end
  end
end

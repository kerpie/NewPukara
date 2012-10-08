class DocumentTypeController < ApplicationController
  
  def index
    @dt = DocumentType.all 
    authorize! :read, @dt
    respond_to do |f|
      f.html
    end
  end

  def create
    @new_dt = DocumentType.new
    @new_dt.name = params[:name]
    authorize! :create, @new_dt
    respond_to do |f|
      if @new_dt.save
        f.js
      else
        f.js {render 'fail_create.js.erb'}
      end
    end
  end

  def destroy

    @del_dt = DocumentType.find(params[:dt_id])
    @del_dt.destroy

    respond_to do |f|
      f.js
    end
  end

  def update
    @up_dt = DocumentType.find(params[:dt_id])
    @up_dt.name = params[:new_value]
    authorize! :update, @up_dt
    respond_to do |f|
      if @up_dt.save
        f.js
      else
        f.js {render 'fail_update.js.erb'}
      end
    end
  end
end

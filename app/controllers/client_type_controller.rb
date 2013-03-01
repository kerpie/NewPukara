class ClientTypeController < ApplicationController
  
  def index
    @ct = ClientType.all 
    authorize! :read, @ct
    respond_to do |f|
      f.html
    end
  end

  def create
    @new_ct = ClientType.new
    @new_ct.name = params[:name]
    @new_ct.identification_type = params[:identification_type]
    @new_ct.identification_quantity = params[:identification_quantity]
    authorize! :create, @new_ct
    respond_to do |f|
      if @new_ct.save
        f.js
      else
        f.js {render 'fail_create.js.erb'}
      end
    end
  end

  def destroy
    @del_ct = ClientType.find(params[:ct_id])
    @del_ct.destroy

    respond_to do |f|
      f.js
    end
  end

  def update
    @up_ct = ClientType.find(params[:ctupdate_id])
    @up_ct.name = params[:up_name]
    @up_ct.identification_type = params[:up_identification_type]
    @up_ct.identification_quantity = params[:up_identification_quantity]
    authorize! :update, @up_ct
    respond_to do |f|
      if @up_ct.save
        f.js
      else
        f.js {render 'fail_update.js.erb'}
      end
    end
  end
end

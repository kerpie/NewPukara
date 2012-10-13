class EntryFoldersController < ApplicationController
  # GET /entry_folders
  # GET /entry_folders.json
  def index
    @entry_folders = EntryFolder.docs_by_supplier(3)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @entry_folders }
    end
  end

  # GET /entry_folders/1
  # GET /entry_folders/1.json
  def show
    @entry_folder = EntryFolder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @entry_folder }
    end
  end

  # GET /entry_folders/new
  # GET /entry_folders/new.json
  def new
    @entry_folder = EntryFolder.new
    @entry_folder.entry_documents.build
    2.times do 
      @entry_folder.entry_document_details.build
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @entry_folder }
    end
  end

  # GET /entry_folders/1/edit
  def edit
    @entry_folder = EntryFolder.find(params[:id])
  end

  # POST /entry_folders
  # POST /entry_folders.json
  def create
    @entry_folder = EntryFolder.new(params[:entry_folder])

    respond_to do |format|
      if @entry_folder.save
        EntryCode.generateEntryCodes(@entry_folder)
        format.html { redirect_to @entry_folder, notice: 'Se ha creado un nuevo registro de ingreso' }
        format.json { render json: @entry_folder, status: :created, location: @entry_folder }
      else
        format.html { render action: "new" }
        format.json { render json: @entry_folder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /entry_folders/1
  # PUT /entry_folders/1.json
  def update
    @entry_folder = EntryFolder.find(params[:id])

    respond_to do |format|
      if @entry_folder.update_attributes(params[:entry_folder])
        format.html { redirect_to @entry_folder, notice: 'Los datos del registro se han modificado' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @entry_folder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entry_folders/1
  # DELETE /entry_folders/1.json
  def destroy
    @entry_folder = EntryFolder.find(params[:id])
    @entry_folder.destroy

    respond_to do |format|
      format.html { redirect_to entry_folders_url }
      format.json { head :no_content }
    end
  end
end

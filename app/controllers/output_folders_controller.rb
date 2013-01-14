class OutputFoldersController < ApplicationController
  # GET /output_folders
  # GET /output_folders.json
  def index
    
    @response = Hash.new 
    
    FolderState.all.each do |fs|
      tmp = OutputFolder.where(:folder_state_id => fs)
      unless(tmp.empty?)
        @response[fs] = tmp
      end
    end

    @output_folders = OutputFolder.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @output_folders }
    end
  end

  # GET /output_folders/1
  # GET /output_folders/1.json
  def show
    @output_folder = OutputFolder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @output_folder }
    end
  end

  # GET /output_folders/new
  # GET /output_folders/new.json
  def new
    @output_folder = OutputFolder.new
    @output_folder.output_documents.build
    @output_folder.output_document_details.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @output_folder }
    end
  end

  # GET /output_folders/1/edit
  def edit
    @output_folder = OutputFolder.find(params[:id])
  end

  # POST /output_folders
  # POST /output_folders.json
  def create
    @output_folder = OutputFolder.new(params[:output_folder])

    respond_to do |format|
      if @output_folder.save
        OutputCode.createOutputCodes(@output_folder)
        format.html { redirect_to @output_folder, notice: 'Output folder was successfully created.' }
        format.json { render json: @output_folder, status: :created, location: @output_folder }
      else
        format.html { render action: "new" }
        format.json { render json: @output_folder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /output_folders/1
  # PUT /output_folders/1.json
  def update
    @output_folder = OutputFolder.find(params[:id])

    respond_to do |format|
      if @output_folder.update_attributes(params[:output_folder])
        format.html { redirect_to @output_folder, notice: 'Output folder was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @output_folder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /output_folders/1
  # DELETE /output_folders/1.json
  def destroy
    @output_folder = OutputFolder.find(params[:id])
    @output_folder.destroy

    respond_to do |format|
      format.html { redirect_to output_folders_url }
      format.json { head :no_content }
    end
  end
end

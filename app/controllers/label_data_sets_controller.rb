class LabelDataSetsController < ApplicationController
  # GET /label_data_sets
  # GET /label_data_sets.xml
  def index
    @label_data_sets = LabelDataSet.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @label_data_sets }
    end
  end

  # GET /label_data_sets/1
  # GET /label_data_sets/1.xml
  def show
    @label_data_set = LabelDataSet.find(params[:id])
    @label_data_set.parse_data

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @label_data_set }
    end
  end

  # GET /label_data_sets/new
  # GET /label_data_sets/new.xml
  def new
    @label_data_set = LabelDataSet.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @label_data_set }
    end
  end

  # GET /label_data_sets/1/edit
  def edit
    @label_data_set = LabelDataSet.find(params[:id])
  end

  # POST /label_data_sets
  # POST /label_data_sets.xml
  def create
    @label_data_set = LabelDataSet.new(params[:label_data_set])
    @label_data_set.excel_data = params[:excel_data]
    respond_to do |format|
      if @label_data_set.save
        format.html { redirect_to(@label_data_set, :notice => 'Label data set was successfully created.') }
        format.xml  { render :xml => @label_data_set, :status => :created, :location => @label_data_set }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @label_data_set.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /label_data_sets/1
  # PUT /label_data_sets/1.xml
  def update
    @label_data_set = LabelDataSet.find(params[:id])

    respond_to do |format|
      if @label_data_set.update_attributes(params[:label_data_set])
        format.html { redirect_to(@label_data_set, :notice => 'Label data set was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @label_data_set.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /label_data_sets/1
  # DELETE /label_data_sets/1.xml
  def destroy
    @label_data_set = LabelDataSet.find(params[:id])
    @label_data_set.destroy

    respond_to do |format|
      format.html { redirect_to(label_data_sets_url) }
      format.xml  { head :ok }
    end
  end
end

class LabelDataController < ApplicationController
  # GET /label_data
  # GET /label_data.xml
  def index
    @label_data = LabelDatum.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @label_data }
    end
  end

  # GET /label_data/1
  # GET /label_data/1.xml
  def show
    @label_datum = LabelDatum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @label_datum }
    end
  end

  # GET /label_data/new
  # GET /label_data/new.xml
  def new
    @label_datum = LabelDatum.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @label_datum }
    end
  end

  # GET /label_data/1/edit
  def edit
    @label_datum = LabelDatum.find(params[:id])
  end

  # POST /label_data
  # POST /label_data.xml
  def create
    @label_datum = LabelDatum.new(params[:label_datum])

    respond_to do |format|
      if @label_datum.save
        format.html { redirect_to(@label_datum, :notice => 'Label datum was successfully created.') }
        format.xml  { render :xml => @label_datum, :status => :created, :location => @label_datum }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @label_datum.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /label_data/1
  # PUT /label_data/1.xml
  def update
    @label_datum = LabelDatum.find(params[:id])

    respond_to do |format|
      if @label_datum.update_attributes(params[:label_datum])
        format.html { redirect_to(@label_datum, :notice => 'Label datum was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @label_datum.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /label_data/1
  # DELETE /label_data/1.xml
  def destroy
    @label_datum = LabelDatum.find(params[:id])
    @label_datum.destroy

    respond_to do |format|
      format.html { redirect_to(label_data_url) }
      format.xml  { head :ok }
    end
  end
end

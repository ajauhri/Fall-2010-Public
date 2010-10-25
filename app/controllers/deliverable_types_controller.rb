class DeliverableTypesController < ApplicationController
  # GET /deliverable_types
  # GET /deliverable_types.xml
  def index
    @deliverable_types = DeliverableType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @deliverable_types }
    end
  end

  # GET /deliverable_types/1
  # GET /deliverable_types/1.xml
  def show
    @deliverable_type = DeliverableType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @deliverable_type }
    end
  end

  # GET /deliverable_types/new
  # GET /deliverable_types/new.xml
  def new
    @deliverable_type = DeliverableType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @deliverable_type }
    end
  end

  # GET /deliverable_types/1/edit
  def edit
    @deliverable_type = DeliverableType.find(params[:id])
  end

  # POST /deliverable_types
  # POST /deliverable_types.xml
  def create
    @deliverable_type = DeliverableType.new(params[:deliverable_type])

    respond_to do |format|
      if @deliverable_type.save
        format.html { redirect_to(@deliverable_type, :notice => 'DeliverableType was successfully created.') }
        format.xml  { render :xml => @deliverable_type, :status => :created, :location => @deliverable_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @deliverable_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /deliverable_types/1
  # PUT /deliverable_types/1.xml
  def update
    @deliverable_type = DeliverableType.find(params[:id])

    respond_to do |format|
      if @deliverable_type.update_attributes(params[:deliverable_type])
        format.html { redirect_to(@deliverable_type, :notice => 'DeliverableType was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @deliverable_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /deliverable_types/1
  # DELETE /deliverable_types/1.xml
  def destroy
    @deliverable_type = DeliverableType.find(params[:id])
    @deliverable_type.destroy

    respond_to do |format|
      format.html { redirect_to(deliverable_types_url) }
      format.xml  { head :ok }
    end
  end
end

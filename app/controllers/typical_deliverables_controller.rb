class TypicalDeliverablesController < ApplicationController
  # GET /typical_deliverables
  # GET /typical_deliverables.xml
  def index
    @typical_deliverables = TypicalDeliverable.all

    respond_to do |format|
      format.html # index.html.erb
      #format.xml  { render :xml => @typical_deliverables }
    end
  end

  # GET /typical_deliverables/1
  # GET /typical_deliverables/1.xml
  def show
    @typical_deliverable = TypicalDeliverable.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      #format.xml  { render :xml => @typical_deliverable }
    end
  end

  # GET /typical_deliverables/new
  # GET /typical_deliverables/new.xml
  def new
    @typical_deliverable = TypicalDeliverable.new

    respond_to do |format|
      format.html # new.html.erb
      #format.xml  { render :xml => @typical_deliverable }
    end
  end

  # GET /typical_deliverables/1/edit
  def edit
    @typical_deliverable = TypicalDeliverable.find(params[:id])
  end

  # POST /typical_deliverables
  # POST /typical_deliverables.xml
  def create
    @typical_deliverable = TypicalDeliverable.new(params[:typical_deliverable])

    respond_to do |format|
      if @typical_deliverable.save
        format.html { redirect_to(@typical_deliverable, :notice => 'TypicalDeliverable was successfully created.') }
        #format.xml  { render :xml => @typical_deliverable, :status => :created, :location => @typical_deliverable }
      else
        format.html { render :action => "new" }
        #format.xml  { render :xml => @typical_deliverable.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /typical_deliverables/1
  # PUT /typical_deliverables/1.xml
  def update
    @typical_deliverable = TypicalDeliverable.find(params[:id])

    respond_to do |format|
      if @typical_deliverable.update_attributes(params[:typical_deliverable])
        format.html { redirect_to(@typical_deliverable, :notice => 'TypicalDeliverable was successfully updated.') }
        #format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        #format.xml  { render :xml => @typical_deliverable.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /typical_deliverables/1
  # DELETE /typical_deliverables/1.xml
  def destroy
    @typical_deliverable = TypicalDeliverable.find(params[:id])
    @typical_deliverable.destroy

    respond_to do |format|
      format.html { redirect_to(typical_deliverables_url) }
      #format.xml  { head :ok }
    end
  end
end

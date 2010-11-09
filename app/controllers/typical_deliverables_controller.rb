# Handles Typical deliverables under a typical lifecycle
class TypicalDeliverablesController < ApplicationController
  
  #  Provides a list of all typical deliverables types
  #  Input params: None
  #  Returns     : Returns a list of all deliverables types
  def index
    @typical_deliverables = TypicalDeliverable.all

    respond_to do |format|
      format.html # index.html.erb
      #format.xml  { render :xml => @typical_deliverables }
    end
  end

  #  Provides a list with different fields of a particular typical deliverables
   #  Input params: TypicalDeliverable.id
   #  Returns     : Returns a hash of all fields related to a TypicalDeliverable
  def show
    @typical_deliverable = TypicalDeliverable.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      #format.xml  { render :xml => @typical_deliverable }
    end
  end

  #  Provides a list of all/required fields needed to create a TypicalDeliverable
  #  Input params: None
  #  Returns     : Returns a hash of different fields of a typical deliverable
  def new
    @typical_deliverable = TypicalDeliverable.new

    respond_to do |format|
      format.html # new.html.erb
      #format.xml  { render :xml => @typical_deliverable }
    end
  end

  #  Provides a list of all/required fields of an existing TypicalDelivearble
  #  Input params: TypicalDelivearble.id
  #  Returns     : Returns a hash of fields and edited values of TypicalDelivearble
  def edit
    @typical_deliverable = TypicalDeliverable.find(params[:id])
  end

  #  Creates a TypicalDeliverable record. 
   #  Input params: All/required params related to a TypicalDeliverable need to be passed
   #  Returns     : A hash of the newly created TypicalDeliverable and a confirmation
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

  #  Updates a TypicalDeliverable record. 
   #  Input params: TypicalDeliverable.id
   #  Returns     : A hash of the newly created TypicalDeliverable and a confirmation 
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

  #  Deletes a TypicalDeliverable record. 
  #  Input params: TypicalDeliverable.id
  #  Returns     : Redirects to the index page of all typical deliverables
  def destroy
    @typical_deliverable = TypicalDeliverable.find(params[:id])
    @typical_deliverable.destroy

    respond_to do |format|
      format.html { redirect_to(typical_deliverables_url) }
      #format.xml  { head :ok }
    end
  end
end

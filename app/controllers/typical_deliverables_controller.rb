# Handles Typical deliverables under a typical lifecycle
class TypicalDeliverablesController < ApplicationController

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
        flash[:notice] = 'Typical Deliverable was successfully created.'
        format.html { redirect_to(:controller => 'catalogs')}
        #format.xml  { render :xml => @typical_deliverable, :status => :created, :location => @typical_deliverable }
      else
        flash[:error] = error_html(@typical_deliverable.errors)
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
        flash[:notice] = 'Typical Deliverable was successfully updated.'
        format.html { redirect_to(:controller => 'catalogs') }
        #format.xml  { head :ok }
      else
        flash[:error] = error_html(@typical_deliverable.errors)
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
      format.html { redirect_to(:controller => 'catalogs') }
      #format.xml  { head :ok }
    end
  end
end

# Handles deliverable types
class DeliverableTypesController < ApplicationController
  
  
  #  Provides a list of all deliverables types
  #  Input params: None
  #  Returns     : Returns a list of all deliverables types
  def index
    @deliverable_types = DeliverableType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @deliverable_types }
    end
  end

  #  Provides a list with different fields of a particular deliverable type
  #  Input params: DeliverableType.id
  #  Returns     : Returns a hash of all fields related to a DelvierableType
  def show
    @deliverable_type = DeliverableType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @deliverable_type }
    end
  end

  #  Provides a list of all/required fields needed to create a DeliverableType
  #  Input params: None
  #  Returns     : Returns a hash of different fields of a deliverable type
  def new
    @deliverable_type = DeliverableType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @deliverable_type }
    end
  end


  #  Provides a list of all/required fields of an existing DeliverableType
  #  Input params: DeliverableType.id
  #  Returns     : Returns a hash of fields and edited values of DeliverableType


  def edit
    @deliverable_type = DeliverableType.find(params[:id])
  end


  #  Creates a DeliverableType record. 
  #  Input params: All/required params related to a DeliverableType need to be passed
  #  Returns     : A hash of the newly created DeliverableType and a confirmation


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

  #  Updates a DeliverableType record. 
  #  Input params: DeliverabeType.id
  #  Returns     : A hash of the newly created DeliverableType and a confirmation 

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


  #  Deletes a DeliverableType record. 
  #  Input params: DeliverabeType.id
  #  Returns     : Redirects to the index page of all deliverables types
  
  def destroy
    @deliverable_type = DeliverableType.find(params[:id])
    @deliverable_type.destroy

    respond_to do |format|
      format.html { redirect_to(deliverable_types_url) }
      format.xml  { head :ok }
    end
  end
end

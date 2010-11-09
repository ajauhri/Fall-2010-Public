# Handles lifecycle functionality
class LifecyclePhasesController < ApplicationController
   # Lists all LifecyclePhases from the DB
   # Input params: None
   # Returns     : Returns a list of all lifecycle phases
   
  def index

    @lifecycle_phases = LifecyclePhase.find_all_by_lifecycle_id(params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lifecycle_phases }
    end
  end

    #  Lists details of a particular LifecyclePhase.
    #  Input params: LifecyclePhase.id
    #  Returns     : Returns a hash of all fields related to a LifecyclePhase
    
  def show
    @lifecycle_phase = LifecyclePhase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @lifecycle_phase }
    end
  end

  #  Provides a list of all/required fields needed to create a LifecyclePhase
  #  Input params: None
  #  Returns     : Returns a hash of different fields of a lifecycle phase
  def new
    @lifecycle_phase = LifecyclePhase.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @lifecycle_phase }
    end
  end


  #  Provides a list of all/required fields of an existing LifecyclePhase
  #  Input params: LifecyclePhase.id
  #  Returns     : Returns a hash of fields and values of LifecyclePhase

  def edit
    @lifecycle_phase = LifecyclePhase.find(params[:id])
  end


  # Creates a LifecyclePhase record. 
  #  Input params: All/required params related to a LifecyclePhase need to be passed
  #  Returns     : A hash of the newly created LifecyclePhase and a confirmation


  def create
    @lifecycle_phase = LifecyclePhase.new(params[:lifecycle_phase])

    respond_to do |format|
      if @lifecycle_phase.save
        format.html { redirect_to(@lifecycle_phase, :notice => 'LifecyclePhase was successfully created.') }
        format.xml  { render :xml => @lifecycle_phase, :status => :created, :location => @lifecycle_phase }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @lifecycle_phase.errors, :status => :unprocessable_entity }
      end
    end
  end

  #  Updates a LifecyclePhase record. 
  #  Input params: LifecylePhase.id
  #  Returns     : A hash of the newly created LifecyclePhase and a confirmation 

  def update
    @lifecycle_phase = LifecyclePhase.find(params[:id])

    respond_to do |format|
      if @lifecycle_phase.update_attributes(params[:lifecycle_phase])
        format.html { redirect_to(@lifecycle_phase, :notice => 'LifecyclePhase was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @lifecycle_phase.errors, :status => :unprocessable_entity }
      end
    end
  end


  #  Deletes a LifecyclePhase record. 
  #  Input params: LifecyclePhase.id
  #  Returns     : Redirects to the index page of all lifecycle phases
  
  def destroy
    @lifecycle_phase = LifecyclePhase.find(params[:id])
    @lifecycle_phase.destroy

    respond_to do |format|
      format.html { redirect_to(lifecycle_phases_url) }
      format.xml  { head :ok }
    end
  end

end

# Handles lifecycle functionality
class LifecyclePhasesController < ApplicationController
   # Lists all LifecyclePhases from the DB
  def index

    @lifecycle_phases = LifecyclePhase.find_all_by_lifecycle_id(params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lifecycle_phases }
    end
  end

    # Lists details of a particular LifecyclePhase. Params required: LifecyclePhases.id
  def show
    @lifecycle_phase = LifecyclePhase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @lifecycle_phase }
    end
  end

  # Renders a new template with all fields required to create a LifecyclePhase
  def new
    @lifecycle_phase = LifecyclePhase.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @lifecycle_phase }
    end
  end

 # Retrieves a LifecyclePhase record. Params required: LifecyclePhase.id
  def edit
    @lifecycle_phase = LifecyclePhase.find(params[:id])
  end


  # Creates a LifecyclePhase record. All params related to a LifecyclePhase need to be passed

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

   # Update a LifecyclePhase record. Params required: LifecyclePhase.id

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

    # Deletes a LifecyclePhase record. Params required: LifecyclePhase.id

  def destroy
    @lifecycle_phase = LifecyclePhase.find(params[:id])
    @lifecycle_phase.destroy

    respond_to do |format|
      format.html { redirect_to(lifecycle_phases_url) }
      format.xml  { head :ok }
    end
  end

end

#Handles deliverables for a project phase
class DeliverablesController < ApplicationController


  #  Provides a list with different fields of a particular deliverable
  #  Input params: Deliverable.id
  #  Returns     : Returns a hash of all fields related to a Delvierable
  def show
    
    @deliverable = Deliverable.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      #format.xml  { render :xml => @deliverable }
    end
  end


  #  Provides a list of all/required fields needed to create a Deliverable
  #  Input params: None
  #  Returns     : Returns a hash of different fields of a deliverable
  def new
    @deliverable = Deliverable.new
    @deliverable.project_phase_id = params[:project_phase_id]

    @estimates = dynamic_estimates
    respond_to do |format|
      format.html # new.html.erb
      #format.xml  { render :xml => @deliverable }
    end
  end


  #  Provides a list of all/required fields of an existing Deliverable
  #  Input params: Deliverable.id
  #  Returns     : Returns a hash of fields and values of Deliverable


  def edit
    @deliverable = Deliverable.find(params[:id])
  end
  
  #  Creates a DeliverableType record. 
  #  Input params: All/required params related to a Deliverable need to be passed
  #  Returns     : A hash of the newly created Deliverable and a confirmation


  def create
    @deliverable = Deliverable.new(params[:deliverable])

    respond_to do |format|
      if @deliverable.save
        format.html { redirect_to(@deliverable.project_phase.project, :notice => 'Deliverables was successfully created.') }
        #format.xml  { render :xml => @deliverable, :status => :created, :location => @deliverables }
      else
        @estimates =  dynamic_estimates
        format.html { render :action => "new" }
        #format.xml  { render :xml => @deliverable.errors, :status => :unprocessable_entity }
      end
    end
  end


  #  Updates a Deliverable record. 
  #  Input params: Deliverabe.id
  #  Returns     : A hash of the newly created Deliverable and a confirmation


  def update
    @deliverable = Deliverable.find(params[:id])

    respond_to do |format|
      if @deliverable.update_attributes(params[:deliverable])
        format.html { redirect_to project_url(@deliverable.project_phase.project) }
        #format.html { redirect_to(@deliverable, :notice => 'Deliverable was successfully updated.') }
        #format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        #format.xml  { render :xml => @deliverable.errors, :status => :unprocessable_entity }
      end
    end
  end


  #  Deletes a Deliverablerecord. 
  #  Input params: Deliverabe.id
  #  Returns     : Redirects to the index page of all deliverables

  def destroy
    @deliverable = Deliverable.find(params[:id])
    project = @deliverable.project_phase.project
    @deliverable.destroy

    respond_to do |format|
      format.html { redirect_to project_url(project) }
      #format.xml  { head :ok }
    end
  end

  private
#  Passes all know deliverables types and complexities to Deliverable model to get minimum, average, and maximum of effort, size and rate.
#  Input params: DeliverableType, and Complexity
#  Returns     : Hash of min, avg, and max of each: effort, size, and rate

   def dynamic_estimates
    estimates = []
    deliverable_types = DeliverableType.find(:all)
    for deliverable_type in deliverable_types
      for complexity in Complexity.getValues
        estimates << {:type => deliverable_type.name, :complexity => complexity,
          :statistics => Deliverable.get_estimates(deliverable_type.name, complexity)}
      end
    end
    return estimates
  end
end

class DeliverablesController < ApplicationController
  # Lists all deliverables from the DB

=begin
  def index
    @deliverables = Deliverable.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @deliverables }
    end
  end
=end

  #  Lists details of a particular deliverable. Params required: Deliverable.id

  def show
    
    @deliverable = Deliverable.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      #format.xml  { render :xml => @deliverable }
    end
  end

  # Renders a new template with all fields required to create a deliverable

  def new
    @deliverable = Deliverable.new
    @estimates = dynamic_estimates
    respond_to do |format|
      format.html # new.html.erb
      #format.xml  { render :xml => @deliverable }
    end
  end

# Retrieves a Deliverable record. Params required: Deliverable.id

  def edit
    @deliverable = Deliverable.find(params[:id])
  end

  # Creates a Deliverable record. All params related to a deliverable need to be passed

  def create
    @deliverable = Deliverable.new(params[:deliverable])

    respond_to do |format|
      if @deliverable.save
        format.html { redirect_to(@deliverable, :notice => 'Deliverables was successfully created.') }
        #format.xml  { render :xml => @deliverable, :status => :created, :location => @deliverables }
      else
        format.html { render :action => "new" }
        #format.xml  { render :xml => @deliverable.errors, :status => :unprocessable_entity }
      end
    end
  end


# Update a Deliverable record. Params required: Deliverable.id

  def update
    @deliverable = Deliverable.find(params[:id])

    respond_to do |format|
      if @deliverable.update_attributes(params[:deliverable])
        format.html { redirect_to(@deliverable, :notice => 'Deliverable was successfully updated.') }
        #format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        #format.xml  { render :xml => @deliverable.errors, :status => :unprocessable_entity }
      end
    end
  end


  # Deletes a Deliverable record. Params required: Deliverable.id

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

   def dynamic_estimates
    estimates = []
    deliverable_types = DeliverableType.find(:all)
    for deliverable_type in deliverable_types
      for complexity in Complexity::VALUES
        estimates << {:type => deliverable_type.name, :complexity => complexity,
          :statistics => Deliverable.get_estimates(deliverable_type.name, complexity)}
      end
    end
    return estimates
  end
end

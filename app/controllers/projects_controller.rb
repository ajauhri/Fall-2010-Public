# Handles project functionality
class ProjectsController < ApplicationController
  # Lists all Projects from the DB

  def index
    @projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @projects }
    end
  end

  # Lists details of a particular Project. Params required: Project.id

  def show
    @project = Project.find(params[:id])
    #@project.project_phases.build
    session[:current_project] = @project.id
    puts "This is the call " + @project.id.to_s
    #puts "Called from show (controller) " + @project.project_phases.size.to_s
    @project_phases = ProjectPhase.find_all_by_project_id(params[:id], :order=>"sequence")
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @project }
    end
  end

  # Renders a new template with all fields required to create a Project

  def new
    @project = Project.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @project }
    end
  end

 # Retrieves a Project record. Params required: Project.id

  def edit
    @project = Project.find(params[:id])
  end

  # Creates a Project record. All params related to a Project need to be passed
  
  def create
    @project = Project.new(params[:project])
   
    respond_to do |format|
      
      if @project.save
        format.html { redirect_to(@project, :notice => 'Project was successfully created.') }
        format.xml  { render :xml => @project, :status => :created, :location => @project }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # Update a Project record. Params required: Project.id

  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to(@project, :notice => 'Project was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # Deletes a Project record. Params required: Project.id
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to(projects_url) }
      format.xml  { head :ok }
    end
  end

  # Updates sequence values of ProjectPhases. Params required: ProjectPhase.id, ProjectPhase.sequence

  def sort
    params[:phaseslist].each_with_index do |id, index|
      ProjectPhase.update_all(['sequence=?',index+1],['id=?',id])
    end
    render :nothing => true
  end


end

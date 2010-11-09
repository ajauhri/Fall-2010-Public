# Handles project functionality
class ProjectsController < ApplicationController

  
  #  Provides a list of all projects
  #  Input params: None
  #  Returns     : Returns a list of all projects
  
  def index
    @projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @projects }
    end
  end

  
  #  Provides a list with different fields of a particular project
  #  Input params: Project.id
  #  Returns     : Returns a hash of all fields related to a Project

  def show
    @project = Project.find(params[:id])
    #@project.project_phases.build
    session[:current_project] = @project.id
    puts "This is the call " + @project.id.to_s
    #puts "Called from show (controller) " + @project.project_phases.size.to_s
    @project_phases = ProjectPhase.find_all_by_project_id(params[:id], :order=>"sequence")
    respond_to do |format|
      format.html # show.html.erb
    end
  end


  #  Provides a list of all/required fields needed to create a Project
  #  Input params: None
  #  Returns     : Returns a hash of different fields of a project

  def new
    @project = Project.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @project }
    end
  end

  #  Provides a list of all/required fields of an existing Project
  #  Input params: Project.id
  #  Returns     : Returns a hash of fields and values of Project

  def edit
    @project = Project.find(params[:id])
  end

  #  Creates a Project record. 
  #  Input params: All/required params related to a Project need to be passed
  #  Returns     : A hash of the newly created Project and a confirmation

  def create
    @project = Project.new(params[:project])
   
    respond_to do |format|
      
      if @project.save
        format.html { redirect_to(@project, :notice => 'Project was successfully created.') }
      else
        flash[:error] = error_html(@project.errors)
        format.html { render :action => "new" }
      end
    end
  end


  #  Updates a Project record. 
  #  Input params: Project.id
  #  Returns     : A hash of the newly created Project and a confirmation
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to(@project, :notice => 'Project was successfully updated.') }
      else
        flash[:error] = error_html(@project.errors)
        format.html { render :action => "edit" }
      end
    end
  end

  #  Deletes a Project record. 
   #  Input params: Project.id
   #  Returns     : Redirects to the index page of all projects
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to(projects_url) }
      format.xml  { head :ok }
    end
  end

  # Updates sequence values of ProjectPhases. 
  # Input params: Params required: ProjectPhase.id, ProjectPhase.sequence
  # Returns     : Provides a hash of the updated sequence of project phases

  def sort
    params[:phaseslist].each_with_index do |id, index|
      ProjectPhase.update_all(['sequence=?',index+1],['id=?',id])
    end
    render :nothing => true
  end


end

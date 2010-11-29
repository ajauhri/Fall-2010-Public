# Handles project phase functionality
class ProjectPhasesController < ApplicationController

=begin
  def index
    @project_phases = ProjectPhase.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @project_phases }
    end
  end
=end

   #  Provides a list with different fields of a particular project phase
   #  Input params: ProjectPhase.id
   #  Returns     : Returns a hash of all fields related to a ProjectPhase
  
  def show
    @project_phase = ProjectPhase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      #format.xml  { render :xml => @project_phase }
    end
  end



  #  Provides a list of all/required fields needed to create a ProjectPhase
  #  Input params: None
  #  Returns     : Returns a hash of different fields of a project phase
  def new
    @project_phase = ProjectPhase.new

    respond_to do |format|
      format.html # new.html.erb
      #format.xml  { render :xml => @project_phase }
    end
  end

  #  Provides a list of all/required fields of an existing ProjectPhase
  #  Input params: ProjectPhase.id
  #  Returns     : Returns a hash of fields and values of ProjectPhase

  
  def edit
    @project_phase = ProjectPhase.find(params[:id])
    if !is_active(@project_phase)
      redirect_to :controllers => 'projects'
    end
  end


  #  Creates a ProjectPhase record. 
  #  Input params: All/required params related to a ProjectPhase need to be passed
  #  Returns     : A hash of the newly created ProjectPhase and a confirmation


  def create
    @project_phase = ProjectPhase.new(params[:project_phase])
    @active = true
      if !is_active(@project_phase)
        redirect_to :controllers => 'projects'
      end
    respond_to do |format|
      if @project_phase.save
        @project = @project_phase.project
        @project_phases = ProjectPhase.find_all_by_project_id(@project_phase.project_id, :order => :sequence)
        format.html { render :partial => @project_phases }
        #format.html { redirect_to(@project_phase.project, :notice => 'Project phase was successfully created.') }
        format.js
        #format.xml  { render :xml => @project_phase, :status => :created, :location => @project_phase }
      else
        format.html { render :action => "new" }
        #format.xml  { render :xml => @project_phase.errors, :status => :unprocessable_entity }
      end
    end
  end


  #  Updates a ProjectPhase record. 
  #  Input params: ProjectPhase.id
  #  Returns     : A hash of the newly created ProjectPhase and a confirmation 


  def update
    @project_phase = ProjectPhase.find(params[:id])
    if !is_active(@project_phase)
      redirect_to :controllers => 'projects'
    end
    if params[:commit] == 'Cancel'
      redirect_to :controller => 'projects', :action => 'show', :id => @project_phase.project.id
    else

    respond_to do |format|
      if @project_phase.update_attributes(params[:project_phase])
        format.html { redirect_to(@project_phase.project, :notice => 'Project phase was successfully updated.') }
        #format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        #format.xml  { render :xml => @project_phase.errors, :status => :unprocessable_entity }
      end
    end
  end
  end


  #  Deletes a ProjectPhase record. 
  #  Input params: ProjectPhase.id
  #  Returns     : Redirects to the index page of all project phase
  
  def destroy
    @project_phase = ProjectPhase.find(params[:id])
    @project_phase.destroy

    respond_to do |format|
      format.html { redirect_to(@project_phase.project) }
      #format.xml  { head :ok }
    end
  end
  
  private
  
  
  #  Checks whether the Project associated with ProjectPhase is active or not
  #  Input params: ProjectPhase


  def is_active(project_phase)
    if project_phase.project
      return project_phase.project.status == 'Active'
    end
  end

end

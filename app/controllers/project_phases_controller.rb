class ProjectPhasesController < ApplicationController
  # GET /project_phases
  # GET /project_phases.xml
  def index
    @project_phases = ProjectPhase.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @project_phases }
    end
  end

  # GET /project_phases/1
  # GET /project_phases/1.xml
  def show
    @project_phase = ProjectPhase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @project_phase }
    end
  end

  # GET /project_phases/new
  # GET /project_phases/new.xml
  def new
    @project_phase = ProjectPhase.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @project_phase }
    end
  end

  # GET /project_phases/1/edit
  def edit
    @project_phase = ProjectPhase.find(params[:id])
  end

  # POST /project_phases
  # POST /project_phases.xml
  def create
    @project_phase = ProjectPhase.new(params[:project_phase])
    
    # Probably there is a better way to do this, using associations, nested forms.
    @project_phase.project_id=session[:current_project]
    
    respond_to do |format|
      if @project_phase.save
        @project_phases = ProjectPhase.find_all_by_project_id(@project_phase.project_id, :order => :sequence)
        format.html { render :partial => @project_phases }
        #format.html { redirect_to(@project_phase.project, :notice => 'Project phase was successfully created.') }
        format.js
        format.xml  { render :xml => @project_phase, :status => :created, :location => @project_phase }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @project_phase.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /project_phases/1
  # PUT /project_phases/1.xml
  def update
    @project_phase = ProjectPhase.find(params[:id])

    respond_to do |format|
      if @project_phase.update_attributes(params[:project_phases])
        format.html { redirect_to(@project_phase, :notice => 'Project phase was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @project_phase.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /project_phases/1
  # DELETE /project_phases/1.xml
  def destroy
    @project_phase = ProjectPhase.find(params[:id])
    @project_phase.destroy

    respond_to do |format|
      format.html { redirect_to(@project_phase.project) }
      format.xml  { head :ok }
    end
  end

end

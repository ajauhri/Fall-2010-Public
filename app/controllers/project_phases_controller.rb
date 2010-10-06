class ProjectPhasesController < ApplicationController
  # GET /project_phases
  # GET /project_phases.xml
  def index
    @project_phases = ProjectPhases.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @project_phases }
    end
  end

  # GET /project_phases/1
  # GET /project_phases/1.xml
  def show
    @project_phases = ProjectPhases.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @project_phases }
    end
  end

  # GET /project_phases/new
  # GET /project_phases/new.xml
  def new
    @project_phases = ProjectPhases.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @project_phases }
    end
  end

  # GET /project_phases/1/edit
  def edit
    @project_phases = ProjectPhases.find(params[:id])
  end

  # POST /project_phases
  # POST /project_phases.xml
  def create
    @project_phases = ProjectPhases.new(params[:project_phases])

    respond_to do |format|
      if @project_phases.save
        format.html { redirect_to(@project_phases, :notice => 'ProjectPhases was successfully created.') }
        format.xml  { render :xml => @project_phases, :status => :created, :location => @project_phases }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @project_phases.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /project_phases/1
  # PUT /project_phases/1.xml
  def update
    @project_phases = ProjectPhases.find(params[:id])

    respond_to do |format|
      if @project_phases.update_attributes(params[:project_phases])
        format.html { redirect_to(@project_phases, :notice => 'ProjectPhases was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @project_phases.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /project_phases/1
  # DELETE /project_phases/1.xml
  def destroy
    @project_phases = ProjectPhases.find(params[:id])
    @project_phases.destroy

    respond_to do |format|
      format.html { redirect_to(projects_url) }
      format.xml  { head :ok }
    end
  end

end

# Handles effort logging
class EffortsController < ApplicationController

  skip_before_filter :restrict_developer

  # Display most recently logged effort and autopopulate select field with most recent
  #  Input params: None
  #  Returns     : Returns a list of all efforts
  def index
    @projects     = Project.find(:all, :conditions => "status = 'Active'")
    @phases       = ProjectPhase.find(:all, :conditions => {:projects => {:status => "Active"}}, :joins => [:project])
    @deliverables = Deliverable.find(:all, :conditions => {:project_phases => {:projects => {:status => "Active"}}}, :joins => [:project_phase => :project])

    if is_developer
    @efforts = Effort.find(:all, :conditions => ['user_id = ?', current_user.id])
    else
      @efforts = Effort.find(:all)
    end
    @efforts.sort! { |a,b| b.effort_date <=> a.effort_date }
    @effort = Effort.new

    respond_to do |format|
      format.html
    end
  end

=begin
  # GET /efforts/1
  # GET /efforts/1.xml
  def show
    @effort = Effort.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @effort }
    end
  end

  # GET /efforts/new
  # GET /efforts/new.xml
  def new
    @effort = Effort.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @effort }
    end
  end


  # GET /efforts/1/edit
  def edit
    @effort = Effort.find(params[:id])
  end
=end

  # Updates an effort log if it exists, otherwise create new effort log
  #  Input params: All/required params related to a Effort and Deliverable.id need to be passed
  #  Returns     : A hash of the newly created Effort

  def create
    @effort = Effort.new(params[:effort])
    if !is_active(@effort)
      redirect_to :controllers => 'projects'
    else
      @effort.user = current_user
      if not @effort.save
        flash[:error] = error_html(@effort.errors)
      end
      redirect_to :action => 'index'
    end
  end

=begin
  # PUT /efforts/1
  # PUT /efforts/1.xml
  def update
    @effort = Effort.find(params[:id])

    respond_to do |format|
      if @effort.update_attributes(params[:effort])
        format.html { redirect_to(@effort, :notice => 'Effort was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @effort.errors, :status => :unprocessable_entity }
      end
    end
  end
=end

  # Removes an effort log
  #  Input params: Effort.id
  #  Returns     : Redirects to the index page of all efforts

  def destroy
    @effort = Effort.find(params[:id])
    @effort.destroy

    respond_to do |format|
      format.html { redirect_to(efforts_url) }
    end
  end

  private

  def is_active(effort)
    if effort.deliverable and effort.deliverable.project_phase and effort.deliverable.project_phase.project
       return effort.deliverable.project_phase.project.status == 'Active'
    end
  end
end

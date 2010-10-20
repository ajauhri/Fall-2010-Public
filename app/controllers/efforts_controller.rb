# Handles effort logging
class EffortsController < ApplicationController
  
  # Display most recently logged effort and autopopulate select field with most recent
  def index
    @projects     = Project.find(:all)
    @phases       = ProjectPhase.find(:all)
    @deliverables = Deliverable.find(:all)
    
    @efforts = Effort.find(:all, :conditions => ['user_id = ?', current_user.id])
    @efforts.sort! { |a,b| b.updated_at <=> a.updated_at }
    @effort = Effort.new

    if params[:selected_deliverable]
      @selected_deliverable = params[:selected_deliverable].to_i
    elsif @efforts.length > 0
      @selected_deliverable = @efforts[0].deliverable_id
    end

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
  def create
    u_id  = current_user.id
    d_id  = params[:effort][:deliverable_id]
    effort_value = params[:effort][:value].to_f

    @effort = Effort.find_by_deliverable_id_and_user_id(d_id, u_id)
    #:all, :conditions => ['deliverable_id = ? and user_id = ?', d_id, u_id])
    if @effort.nil?
      @effort                 = Effort.new(params[:effort])
      @effort.user_id         = u_id
    else
      @effort.value += effort_value
    end

    #deliverable_effort = Deliverable.find(d_id).actual_effort
    #deliverable_effort += effort_value
    #Deliverable.update(:actual_effort => deliverable_effort)

    if not @effort.save
      flash[:error] = error_html(@effort.errors)
    end
    redirect_to :action => 'index'
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
  def destroy
    @effort = Effort.find(params[:id])
    @effort.destroy

    respond_to do |format|
      format.html { redirect_to(efforts_url) }
    end
  end
end

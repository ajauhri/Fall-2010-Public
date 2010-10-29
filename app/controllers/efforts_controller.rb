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
    d_id  = params[:effort][:deliverable_id]
    value = params[:effort][:value].to_f

    @effort = Effort.find_by_deliverable_id_and_user_id(d_id, current_user.id)
    @effort = Effort.new(:user_id => current_user.id, :deliverable_id => d_id) if @effort.nil?
    @effort.value == nil ? @effort.value = value : @effort.value += value
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

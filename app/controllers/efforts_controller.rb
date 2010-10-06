class EffortsController < ApplicationController
  # GET /efforts
  # GET /efforts.xml
  def index
    @deliverables = Deliverable.find(:all) # FOR NOW, NEED TO CHANGE TO MAKE THIS APPEAR WITH AJAX
    @efforts = Effort.find(:all, :conditions => ['user_id = ?', current_user.id])
    @efforts.sort! { |a,b| a.updated_at <=> b.updated_at }
    @effort = Effort.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @efforts }
    end
  end

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

  # POST /efforts
  # POST /efforts.xml
  def create
    u_id  = current_user.id
    d_id  = params[:effort][:deliverable_id]
    @effort = Effort.find_by_deliverable_id_and_user_id(d_id, u_id)#:all, :conditions => ['deliverable_id = ? and user_id = ?', d_id, u_id])
    if @effort.nil?
      @effort                 = Effort.new(params[:effort])
      @effort.user_id         = u_id
      #@effort.deliverable_id  = d_id
    else
      @effort.value += params[:effort][:value].to_f
    end

    if @effort.save
      redirect_to :action => 'index'
    else
      flash[:error] = error_html(@effort.errors)
      redirect_to :action => 'index'
    end
  end

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

  # DELETE /efforts/1
  # DELETE /efforts/1.xml
  def destroy
    @effort = Effort.find(params[:id])
    @effort.destroy

    respond_to do |format|
      format.html { redirect_to(efforts_url) }
      format.xml  { head :ok }
    end
  end
end

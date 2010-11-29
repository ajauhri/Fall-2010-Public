class LifecyclesController < ApplicationController

  #  Provides a list of all/required fields needed to create a Lifecycle
  #  Input params: None
  #  Returns     : Returns a hash of different fields of a lifecycle
  def new
    @lifecycle = Lifecycle.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @lifecycle }
    end
  end

  #  Provides a list of all/required fields of an existing Lifecycle
  #  Input params: Lifecycle.id
  #  Returns     : Returns a hash of fields and values of Lifecycle
  
  def edit
    @lifecycle = Lifecycle.find(params[:id])
  end

  # Creates a Lifecycle record. 
  #  Input params: All/required params related to a Lifecycle need to be passed
  #  Returns     : A hash of the newly created Lifecycle and a confirmation

  def create
    @lifecycle = Lifecycle.new(params[:lifecycle])

    respond_to do |format|
      if @lifecycle.save
        flash[:notice] = 'Lifecycle was successfully created.'
        format.html { redirect_to(:controller => 'catalogs') }
       # format.xml  { render :xml => @lifecycle, :status => :created, :location => @lifecycle }
      else
        flash[:error] = error_html(@lifecycle.errors)
        format.html { render :action => "new" }
        #format.xml  { render :xml => @lifecycle.errors, :status => :unprocessable_entity }
      end
    end
  end

  #  Updates a Lifecycle record. 
  #  Input params: Lifecyle.id
  #  Returns     : A hash of the newly created Lifecycle and a confirmation 

  def update
    @lifecycle = Lifecycle.find(params[:id])

    respond_to do |format|
      if @lifecycle.update_attributes(params[:lifecycle])
        flash[:notice] = 'Lifecycle was successfully updated.'
        format.html { redirect_to(:controller => 'catalogs') }
        #format.xml  { head :ok }
      else
        flash[:error] = error_html(@lifecycle.errors)
        format.html { render :action => "edit" }
        #format.xml  { render :xml => @lifecycle.errors, :status => :unprocessable_entity }
      end
    end
  end


  #  Deletes a Lifecycle record. 
  #  Input params: Lifecycle.id
  #  Returns     : Redirects to the index page of all lifecycle 

  def destroy
    @lifecycle = Lifecycle.find(params[:id])
    @lifecycle.destroy

    respond_to do |format|
      format.html { redirect_to(:controller => 'catalogs') }
      format.xml  { head :ok }
    end
  end
end

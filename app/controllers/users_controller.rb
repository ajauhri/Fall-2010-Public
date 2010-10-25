# Handles user functionality
class UsersController < ApplicationController

  before_filter :require_user, :except => ['new', 'create']
  before_filter :require_admin, :except => ['edit', 'update']

  # Lists all Projects from the DB
  def new
    @user = User.new
  end

  # Creates a Project record. All params related to a Project need to be passed
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Registration Successful!"
      redirect_to :controller => 'projects', :action => 'index'
    else
      render :action => "new"
    end
  end

  # Retrieves a Project record. Params required: Project.id
  def edit
    @user = current_user
  end


  # Update a Project record. Params required: Project.id
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Profile successfully updated."
      redirect_to root_url
    else
      render :action => 'edit'
    end
  end

=begin
  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    ##
    ## Delete effort logs first if we ever support deleting users
    ##
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
=end
  # Redirects if the current_user is not Admin
  def require_admin
     if !is_admin
       redirect_to :controller => 'user_sessions', :action => 'destroy', :id => 'intruder'
     end
  end
  
  def is_admin
    return current_user.role == User::ADMIN
  end
  
end

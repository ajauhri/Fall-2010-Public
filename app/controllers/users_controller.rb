# Handles user functionality
class UsersController < ApplicationController

  before_filter :require_user, :except => ['new', 'create'] 
  before_filter :require_admin, :except => ['edit', 'update'] 
  before_filter :load_user_using_perishable_token, :only => ['edit_password', 'update_password']
  

  #  Provides a list of all/required fields needed to create a User
  #  Input params: None
  #  Returns     : Returns a hash of different fields of a user
  

  def new
    @user = User.new
  end

  #  Creates a User record. 
  #  Input params: All/required params related to a User need to be passed
  #  Returns     : A hash of the newly created User and a confirmation
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Registration Successful!"
      redirect_to :controller => 'projects', :action => 'index'
    else
      render :action => "new"
    end
  end


  #  Provides a list of all/required fields of an existing User(only the user logged in can edit)
  #  Input params: User.id
  #  Returns     : Returns a hash of fields and edited values of User 
  def edit
    @user = current_user
  end
  
  #  Updates a DeliverableType record. 
  #  Input params: DeliverabeType.id
  #  Returns     : A hash of the newly created DeliverableType and a confirmation
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
  # Checks wheter the current user is admin or not
  def is_admin
    return current_user.role == User::ADMIN
  end


end

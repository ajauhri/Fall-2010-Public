# Handles a user session
class UserSessionsController < ApplicationController

   before_filter :require_user, :except => ['new', 'create']
   

  #  Create a new user session
   #  Input params: None
   #  Returns     : Returns a hash of the user session
  def new
    if current_user
      redirect_to  root_url
    end
    @user_session = UserSession.new
  end

  #  Creates a UserSession record. 
   #  Input params: All/required params related to a UserSession need to be passed
   #  Returns     : A hash of the newly created UserSession

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      redirect_to :controller => 'projects', :action => 'index'
    else
      flash[:error] = "The username or password you entered is incorrect!"
      render :action => 'new'
    end
  end
  
   #  Deletes a UserSession. 
   #  Input params: UserSession
   #  Returns     : Redirects to the login page
  

  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    if params[:id] == 'intruder'
      flash[:error] = "You're not allowed in here!"
    else
    flash[:notice] = "Successfully logged out."
    end
    redirect_to :action => 'new'
  end

end

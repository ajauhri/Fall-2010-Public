# Handles a user session
class UserSessionsController < ApplicationController

  before_filter :require_user, :except => ['new', 'create']

  def new
    if current_user
      redirect_to  root_url
    end
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      redirect_to :controller => 'projects', :action => 'index'
    else
      flash[:error] = "The username or password you entered is incorrect!"
      render :action => 'new'
    end
  end

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

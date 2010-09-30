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
      flash[:notice] = "Successfully logged in."
      redirect_to :controller => 'projects', :action => 'index'
    else
      render :action => 'new'
    end
  end

  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Successfully logged out."
    redirect_to :action => 'new'
  end

end

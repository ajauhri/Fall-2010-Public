class UserSessionsController < ApplicationController
before_filter :check_user, :only => [:new]

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Successfully logged in."
      redirect_to :controller => 'pet', :action => 'index'
    else
      render :action => 'new'
    end
  end

  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Successfully logged out."
    redirect_to :controller => 'pet', :action => 'index'
  end

end

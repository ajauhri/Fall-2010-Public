class UsersController < ApplicationController

  before_filter :require_user, :except => ['new', 'create']
  before_filter :require_admin, :except => ['edit', 'update']

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new
  end

   # POST /users
  # POST /users.xml
  def create
      @user = User.new(params[:user])
        if @user.save
          flash[:notice] = "Registration Successful!"
          redirect_to :controller => 'projects', :action => 'index'
        else
          render :action => "new"
        end
  end

  # GET /users/1/edit
  def edit
    @user = current_user
  end

 

  # PUT /users/1
  # PUT /users/1.xml
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

  def require_admin
    redirect_to :controller => 'user_sessions', :action => 'destroy', :id => 'intruder' if not current_user.role == User::ADMIN
  end
end

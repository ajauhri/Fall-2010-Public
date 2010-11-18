class PasswordsController < ApplicationController

  before_filter :load_user_using_perishable_token, :only => ['edit', 'update']

  def new
    render
  end


  def send_password
    if params[:commit] == 'Back'
      redirect_to login_url
    else
      @user = User.find_by_email(params[:user][:email])
      if @user
        @user.deliver_password_reset_instructions!
        flash[:notice] = "An email has been sent to you with instructions on how to change your password"
        redirect_to login_url
      else
        flash[:error] = "The email address entered is not registered"
        render :action => 'new'
      end
    end
  end


  def edit
    render
  end


  def update
    if params[:commit] == 'Back'
      redirect_to login_url
    else
      if @user.update_attributes(:password => params[:user][:password], :password_confirmation => params[:user][:password_confirmation])
        flash[:notice] = "Password successfully changed"
        redirect_to root_url
      else
        render :action => 'edit'
      end
    end
  end

  private

  def load_user_using_perishable_token
    @user = User.find_using_perishable_token(params[:id])
    unless @user
      flash[:notice] = "We're sorry, but we could not locate your account. " +
        "If you are having issues try copying and pasting the URL " +
        "from your email into your browser or restarting the " +
        "reset password process."
      redirect_to root_url
    end
  end

end

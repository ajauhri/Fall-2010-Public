# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
 before_filter :set_cache_buster, :require_user, :restrict_developer

# Doesn't allow browsers to cache web pages

  def set_cache_buster
   
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"

  end

  def only_admin
    if !is_admin
      redirect_to projects_path
    end
  end

  layout 'application'

  helper_method :current_user, :error_html, :is_developer, :is_manager, :is_admin

  private

# Used to authenticate a user session

  def current_user_session
    return @curent_user_session if defined?(@curent_user_session)
    @current_user_session = UserSession.find
  end

 # Returns the current_user session

  def current_user
    @current_user = current_user_session && current_user_session.record
  end

  # Checks for user sessions against methods which require user authentication
  def require_user
    unless current_user or controller_name == 'passwords'
        redirect_to login_url
    end
  end


  
  # Only allows access to effort logs for manager and admin types
  def restrict_developer
    return if controller_name == 'user_sessions' and action_name == 'destroy'
    if current_user and is_developer 
      redirect_to :controller => 'efforts'
    end
  end

  # Checks wheter the current user is a developer or not
  def is_developer
    return current_user.role == User::DEVELOPER
  end

  def is_manager
    return current_user.role == User::MANAGER
  end



      def is_admin
        return current_user.role == User::ADMIN
  end

  # Records execution errors, formats them for display

  def error_html(errors)
    html = "<b><u>Error!</u></b><br/>"
    for error in errors
      html += "#{error[0].capitalize.humanize} #{error[1]}<br/>"
    end
    return html
  end


end

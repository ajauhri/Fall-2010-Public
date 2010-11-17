# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  # Helper to display links in tabs format or text format
  def display_links(tag = '', end_tag = '')
    html = ""
    spacer = ''
    spacer = "|" if tag == ''
    if !is_developer
      html += tag + get_link("<span></span>Project Management", 'projects', 'index') + end_tag + spacer
      html += tag + get_link("<span></span>Create New Project", 'projects', 'new') + end_tag + spacer
    end
    html += tag + get_link("<span></span>Log Effort", 'efforts', 'index') + end_tag
    if is_admin
      html += tag + get_link("<span></span>Catalogs",'catalogs','index') + end_tag + spacer
    end
    return html
  end

  # Helper to create a link_to call
  def get_link(string, controller, action)
    if controller_name == controller and action_name == action
      return "<a class = 'sel'>#{string}</a>"
    else
      return link_to string, :controller => controller, :action => action
    end
  end


end

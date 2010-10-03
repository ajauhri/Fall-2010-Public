# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def display_links(tag = '', end_tag = '')
    html = ""
    spacer = ''
    spacer = "|" if tag == ''
    html += tag + get_link("<span></span>Project Management", 'projects', 'index') + end_tag + spacer
    html += tag + get_link("<span></span>Create New Project", 'projects', 'new') + end_tag + spacer
    html += tag + link_to("<span></span>Log Effort", '#') + end_tag
    return html
  end

  def get_link(string, controller, action)
    if controller_name == controller and action_name == action
      return "<a class = 'sel'>#{string}</a>"
    else
      return link_to string, :controller => controller, :action => action
    end
  end
end

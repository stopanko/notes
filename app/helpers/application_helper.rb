module ApplicationHelper

  def page_titles(big = 'Welcome to', small = 'notes app')
    content_for :page_header do
      big
    end
    content_for :sub_header do
      small
    end
  end


  def active_menu(controller = 'home', action = 'index')
    'active' if params[:controller] == controller && params[:action] == action
  end

end

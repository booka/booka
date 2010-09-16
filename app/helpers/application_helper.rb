# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def title(title)
    content_for(:title) {title}
  end

  def link_to_ajax(name, url = {}, html_options = {})
    html_options[:rel] = "address:" + url
    link_to(name, url, html_options)
  end

  def dialog_to(name, options = {}, html_options = {})
    html_options[:rel] = "dialog:" + options
    link_to(name, options, html_options)
  end
end

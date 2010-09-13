module WorkspaceHelper

  def ibutton_to(label, icon, url)
    dialog_to(label, url, :title => label, :class => "iconic iconic-#{icon}_16x16")
  end

  def iminbutton_to(label, icon, url)
    dialog_to(label, url, :title => label, :class => "iconic iconic-#{icon}_12x12")
  end

  def navigate_to(enabled, name, title, url)
    image = enabled ? link_to_ajax(title, url, :class => "sprite-nav sprite-nav-#{name}icon", :id => "navigate-to-#{name}") :
      content_tag(:div, ' ', :class => "sprite-nav sprite-nav-#{name}icon navigation-disabled")
    content_tag(:li, image)
  end

  def render_page(bok)
    render :partial => 'documents/document', :object => bok
  end

  def place(place)
    content_for(:place) {place}
    content_for(:title) {place}
  end

  def place_of(bok)
    place t('.place', :title => bok.title)
  end
end

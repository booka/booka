module WorkspaceHelper
  def navigate_to(name, url)
    content_tag(:li, link_to(t(name), url, :class => 'navigate_to', :id => name))
  end

  def render_page(bok)
    render :partial => 'documents/document', :object => bok
  end

  def place(place)
    content_for(:place) {place}
  end

  def place_of(bok)
    place t('.place', :title => bok.title)
  end
end


class Clip < Bok
  validates_presence_of :project_id, :content_type
  include AutoHtml

  def body_rendered
    if content_type == 'text/html'
      self.body
    else
      to_html
    end
  end

  def to_html
    auto_html(self.body) do
      html_escape
      image
      youtube :width => 400, :height => 250
      link :target => "_blank", :rel => "nofollow"
      simple_format
    end
  end


end

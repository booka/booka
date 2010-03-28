
class Clip < Bok
  validates_presence_of :project_id, :content_type

  def body_rendered
    if content_type == 'text/html'
      self.body
    else
      body_html
    end
  end

  private
  def body_html
    auto_html(self.body) do
      html_escape
      image
      youtube :width => 400, :height => 250
      link :target => "_blank", :rel => "nofollow"
      simple_format
    end
  end


end

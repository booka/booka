# == Schema Information
# Schema version: 20100327212638
#
# Table name: boks
#
#  id           :integer         not null, primary key
#  project_id   :integer
#  user_id      :integer
#  position     :integer
#  type         :string(255)
#  ancestry     :string(255)
#  title        :string(255)
#  description  :string(255)
#  content_type :string(255)
#  properties   :string(255)
#  body         :text
#  created_at   :datetime
#  updated_at   :datetime
#


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
      image
      youtube :width => 400, :height => 250
      link :target => "_blank", :rel => "nofollow"
      # simple_format
    end
  end


end

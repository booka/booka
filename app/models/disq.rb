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

# Discussion item
class Disq < Bok
  validates_presence_of :project_id, :content_type

  TYPES = ['question', 'proposal', 'consensus']

  def new_response(user, params)
    new_children_of_type(Disq, user, params)
  end
end

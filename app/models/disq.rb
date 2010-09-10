# == Schema Information
# Schema version: 20100910132042
#
# Table name: boks
#
#  id           :integer(4)      not null, primary key
#  project_id   :integer(4)
#  user_id      :integer(4)
#  position     :integer(4)
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

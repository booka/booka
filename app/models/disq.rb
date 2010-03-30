# Discussion item
class Disq < Bok
  validates_presence_of :project_id, :content_type

  TYPES = ['question', 'proposal', 'consensus']

  def new_response(user, params)
    new_children_of_type(Disq, user, params)
  end
end

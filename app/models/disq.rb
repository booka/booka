# Discussion item
class Disq < Bok
  validates_presence_of :project_id, :content_type

  def new_response(params, user)
    extra = {:project_id => self.project_id, :parent_id => self.id, :user_id => user.id}
    extra.merge!(params) if params
    Disq.new(extra)
  end
end

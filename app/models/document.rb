

class Document < Bok

  validates_presence_of :project_id

  def clips
    self.children.scoped(:conditions => {:type => 'Clip'})
  end

  def new_clip(user, params)
    new_children_of_type(Clip, user, params)
  end


end

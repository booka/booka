

class Document < Bok

  validates_presence_of :project_id

  def clips
    self.children.scoped(:conditions => {:type => 'Clip'})
  end

  def new_clip(params, user)
    extra = {:parent_id => self.id, :project_id => self.project.id, :user_id => user.id}
    Clip.new(params.merge(extra))
  end


end

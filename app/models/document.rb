

class Document < Bok

  validates_presence_of :project_id

  def clips
    self.children.scoped(:conditions => {:type => 'Clip'})
  end


end

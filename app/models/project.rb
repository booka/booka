
class Project < Bok

  has_many :documents

  def add_user(user, level)
    Permission.create!(:bok_id => self.id, :user_id => user.id, :level => level.to_s)
  end

  def call
    self.children.find(:first, :conditions => {:type => 'ProjectCall'})
  end

  def documents
    self.children.scoped(:conditions => {:type => 'Document'})
  end

  def disqs
    self.children.scoped(:conditions => {:type => 'Disq'})
  end

  def new_document(params = {}, user = nil?)
    extra = {:parent => self, :project => self}
    extra.merge!({:user_id => user.id}) if user
    Document.new(params.merge(extra))
  end

  def new_disq(params, user)
    extra = {:parent_id => self.id, :project_id => self.id, :user_id => user.id}
    extra.merge!(params) if params
    Disq.new(extra)
  end

end

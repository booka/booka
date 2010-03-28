
class Project < Bok


  def add_user(user, level)
    Permission.create!(:bok_id => self.id, :user_id => user.id, :level => level.to_s)
  end

  def call
    self.children.find(:first, :conditions => {:type => 'ProjectCall'})
  end

  def documents
    self.children.find(:all, :conditions => {:type => 'Document'})
  end

end

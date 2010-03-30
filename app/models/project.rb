
class Project < Bok

  has_many :documents

  def add_user(user, level)
    Permission.create!(:bok_id => self.id, :user_id => user.id, :level => level.to_s)
  end

  def calls
    children_of_type(ProjectCall)
  end

  def new_call(user, params)
    new_children_of_type(ProjectCall, user, params)
  end

  def documents
    children_of_type(Document)
  end

  def new_document(user, params)
    new_children_of_type(Document, user, params)
  end

  def disqs
    children_of_type(Disq)
  end

  def new_disq(user, params)
    new_children_of_type(Disq, user, params)
  end

  def indexes
    children_of_type(Index)
  end

  def new_index(user, params)
    new_children_of_type(Index, user, params)
  end


end

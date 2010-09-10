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


class Project < Bok

  has_many :documents
  after_create :create_default_call_and_index
  after_update :update_call_and_index

  def stage
    properties[:stage]
  end

  def stage=(stage)
    properties[:stage] = stage
  end

  def visibility
    properties[:visibility]
  end

  def visibility=(visibility)
    properties[:visibility] = visibility
  end

  def add_user(user, level)
    Permission.create!(:bok_id => self.id, :user_id => user.id, :level => level.to_s)
  end

  def call
    Document.find self.properties[:call] if properties[:call]
  end

  def index
    Index.find self.properties[:index] if properties[:index]
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

  private
  def create_default_call_and_index
    call = self.new_document(self.user, :title => "Convocatoria de '#{self.title}'")
    call.save!
    index = self.new_index(self.user, :title => "Índice de '#{self.title}'")
    index.save!
    self.properties[:call] = call.to_param
    self.properties[:index] = index.to_param
    self.save!
  end

  def update_call_and_index
    self.call.update_attribute(:title,  "Convocatoria de '#{self.title}'")
    self.index.update_attribute(:title, "Índice de '#{self.title}'")
  end

end

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

# Bok
#

class Bok < ActiveRecord::Base
  has_ancestry
  acts_as_list :scope => "ancestry"
  serialize :properties

  belongs_to :user
  belongs_to :project, :class_name => 'Project'

  has_many :permissions
  has_many :users, :through => :permissions
  
  validates_presence_of :user_id

  def author=(author)
    properties[:author] = author
  end

  def author
    properties[:author]
  end

  def after_initialize
    self.properties ||= {}
  end

  def children_of_type(children_class)
    self.children.scoped(:conditions => {:type => children_class.to_s})
  end

  def new_children_of_type(children_class, user, params)
    extra = {:parent_id => self.id, :project_id => self.id, :user_id => user.id}
    extra.merge!(params) if params
    children_class.new(extra)
  end

  def to_param
    title ? "#{id}-#{title.parameterize}" : id.to_s
  end
  
end

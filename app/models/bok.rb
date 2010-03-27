class Bok < ActiveRecord::Base
  belongs_to :user
  has_ancestry
  belongs_to :project, :class_name => 'Project'

  has_many :children, :foreign_key => 'parent_id', :class_name => 'Bok', :order => 'position'
  acts_as_list :scope => "ancestry"

  attr_reader :user_name

  validates_presence_of :user_id
end

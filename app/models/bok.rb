class Bok < ActiveRecord::Base
  has_ancestry
  acts_as_list :scope => "ancestry"

  belongs_to :user
  belongs_to :project, :class_name => 'Project'

  has_many :permissions
  has_many :users, :through => :permissions
  
  validates_presence_of :user_id
end

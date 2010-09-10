# == Schema Information
# Schema version: 20100910132042
#
# Table name: activities
#
#  id          :integer(4)      not null, primary key
#  user_id     :integer(4)
#  project_id  :integer(4)
#  bok_id      :integer(4)
#  action      :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  belongs_to :bok
  
  def self.project(desc, action, user, project)
    Activity.create!(:action => action, :user => user, :project => project, :bok => project, :description =>  desc)
  end
end

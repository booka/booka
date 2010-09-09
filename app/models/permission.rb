# == Schema Information
# Schema version: 20100327212638
#
# Table name: permissions
#
#  id         :integer         not null, primary key
#  bok_id     :integer
#  user_id    :integer
#  level      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Permission < ActiveRecord::Base
  belongs_to :bok
  belongs_to :user

  validates_presence_of :bok_id, :user_id, :level
end

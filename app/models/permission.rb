# == Schema Information
# Schema version: 20100910132042
#
# Table name: permissions
#
#  id         :integer(4)      not null, primary key
#  bok_id     :integer(4)
#  user_id    :integer(4)
#  level      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Permission < ActiveRecord::Base
  belongs_to :bok
  belongs_to :user

  validates_presence_of :bok_id, :user_id, :level
end

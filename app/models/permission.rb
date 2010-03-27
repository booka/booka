class Permission < ActiveRecord::Base
  belongs_to :bok
  belongs_to :user

  validates_presence_of :bok_id, :user_id, :level
end

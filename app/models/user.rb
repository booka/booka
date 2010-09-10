# == Schema Information
# Schema version: 20100327212638
#
# Table name: users
#
#  id                :integer         not null, primary key
#  name              :string(255)
#  login             :string(255)
#  rol               :string(255)     default("user")
#  crypted_password  :string(255)
#  password_salt     :string(255)
#  persistence_token :string(255)
#  login_count       :integer
#  last_login_at     :datetime
#  current_login_at  :datetime
#  last_login_ip     :string(255)
#  current_login_ip  :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#

class User < ActiveRecord::Base
  acts_as_authentic
  has_many :permissions
  has_many :boks, :through => :permissions

  def projects
    self.boks.scoped(:conditions => {:type => 'Project'})
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end

end

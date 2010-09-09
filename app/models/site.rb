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


class Site < Bok

  def self.get
    Site.find(:first)
  end

  def new_project(user, params)
    new_children_of_type(Project, user, params.merge(:project_id => nil))
  end

  def projects
    childrens_of_type(Project)
  end
end


class Site < Bok

  def new_project(user, params)
    new_children_of_type(Project, user, params.merge(:project_id => nil))
  end

  def projects
    childrens_of_type(Project)
  end
end

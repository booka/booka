module JsBookaHelper

  def js(text)
    escape_javascript(text)
  end

  def js_str(text)
    "'#{escape_javascript(h text)}'"
  end


  def js_partial(partial)
    "\"#{escape_javascript(render :partial => partial)}\""
  end

  def js_project(project)
    code = ""
    if (params[:project] != project.id.to_s)
      code = code + "$.booka.layout.project(#{js_str project.id}, #{js_str(h(project.title))}, #{js_partial '/layouts/site_navigation'});"
      code = code + "$.booka.layout.projectStages(#{ js_partial '/projects/stages' });";
    end
    code
  end

  def js_before
    code = nil
    if current_user
      code = "$.booka.user.set(#{current_user.id}, #{js_str current_user.name}, 'address:#{js current_user_path}');"
    else
      code = "$.booka.user.set(null, 'Entrar', 'dialog:#{js new_user_sessions_path(:url => request.path)}');"
    end
    if @project
      code = code + js_project(@project)
    end
    code
  end


end

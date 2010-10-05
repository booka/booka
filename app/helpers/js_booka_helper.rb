module JsBookaHelper

  def js(text)
    escape_javascript(text)
  end

  def js_action_to(label, icon, url)
    link_to_ajax(label, url, :title => label, :class => "iconic iconic-#{icon}_12x12")
  end

  def js_str(text)
    "'#{escape_javascript(h text)}'"
  end


  def js_partial(partial, model = nil)
    rendered = model ? render(:partial => partial, :object => model) : render(:partial => partial)
    "\"#{escape_javascript(rendered)}\""
  end

  def js_project(project)
    code = ""
    if (params[:project] != project.id.to_s)
      code = code + "$.booka.layout.project(#{js_str project.id}, #{js_str(h(project.title))}, #{js_partial '/layouts/site_navigation'});"
      code = code + "$.booka.layout.projectStages(#{ js_partial '/projects/stages' });";
    end
    code
  end

  def js_browse(name, path, message = nil)
    code = ""
    if (params[:browser] != name)
      code = "$.booka.layout.browser('#{name}', #{js_partial path});"
    end
    code
  end

  def js_before
    code = "$.booka.ajax.token(#{js_str request.path[0..-4]});"
    if current_user
      code = code + "$.booka.user.set(#{current_user.id}, #{js_str current_user.name}, 'address:#{js current_user_path}');"
    else
      code = code + "$.booka.user.set(null, 'Entrar', 'dialog:#{js new_user_sessions_path(:url => request.path)}');"
    end
    if @project
      code = code + js_project(@project)
    end
    code
  end

  def js_show_dialog(partial)
    "$.booka.dialogs.show('#{js_partial partial}');"
  end


end

module JsBookaHelper
  def js_place_of(bok)
    js_place t('.place', :title => bok.title)
  end

  def js_place(text)
    "$('#place').html('#{escape_javascript text}');"
  end

  def js_project(project)
    if (params[:project] != project.id.to_s)
      content = escape_javascript render(:partial => '/layouts/site_navigation')
      "$.booka.project('#{project.id}', '#{project.title}', '#{content}');"
    end
  end

  def js_browser(partial)
    if (params[:browser] != partial)
      "$.booka.browser('#{partial}', '#{js_partial partial}');"
    end
  end

  def js_content_for(div_id, content)
    "$('##{div_id}').html('#{escape_javascript content}');"
  end

  def js_partial_for(position, partial)
    content = render :partial => partial
    js_content_for(position, content)
  end

  def js_render_disq(disq)
    content = render(:partial => 'disqs/disq', :locals => {:disq => disq, :tree => disq.subtree.arrange})
    js_content_for('content_viewport', content)
  end

  def js_render_index(index)
    content = render(:partial => 'indexes/index', :object => index)
    js_content_for('content_viewport', content)
  end

  def js_render_document(bok)
    content = render(:partial => 'documents/document', :object => bok)
    js_content_for('content_viewport', content)
  end

  def js_clear_page
    js_content_for('content_viewport', '')
  end

  def js_finish(message)
    "$.booka.flash('#{escape_javascript message}');" +
      "$('a[rel*=address:]').address();"
  end

  def js_show_dialog(partial)
    "$.booka.dialog('#{js_partial partial}');"
  end

  def js_update_dialog(partial)
    "$('#simplemodal-container').html('#{js_partial partial}');" +
      "$.booka.dialogSetup();"
  end

  def js_partial(partial)
    escape_javascript(render :partial => partial)
  end

end

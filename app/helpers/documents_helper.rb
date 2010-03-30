module DocumentsHelper

  def slot_for(document, clip = nil)
    if clip
      dialog_to ' ', new_document_clip_path(document, 'clip[content_type]' => 'text/auto_html', 'clip[position]' => clip.position), :class => 'slot'
    else
      dialog_to ' ', new_document_clip_path(document, 'clip[content_type]' => 'text/auto_html'), :class => 'slot'
    end
  end


  def slots_for(document, clip)
    render :partial => 'documents/slot', :locals => {:document => document, :clip => clip}
  end

  def slot_link(label, content_type, document, clip)
    if clip
      link_to t(label), new_document_clip_path(document, 'clip[content_type]' => content_type, 'clip[position]' => clip.position)
    else
      link_to t(label), new_document_clip_path(document, 'clip[content_type]' => content_type)
    end
  end
end

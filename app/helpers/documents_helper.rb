module DocumentsHelper
  def slots_for(document, clip)
    render :partial => 'documents/slot', :locals => {:document => document, :clip => clip}
  end

  def slot_link(label, content_type, document, clip)
    if clip
      link_to t(label), new_document_document_clip_path(document, 'clip[content_type]' => content_type, 'clip[position]' => clip.position)
    else
      link_to t(label), new_document_document_clip_path(document, 'clip[content_type]' => content_type)
    end
  end
end

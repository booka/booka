module ProjectDisqsHelper
  def render_disq(disq, subtree, top = nil)
    top ||= disq
    render :partial => 'disqs/disq', :locals => {:disq => disq, :subtree => subtree, :top => top}
  end
end

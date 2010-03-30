module ProjectDisqsHelper
  def render_answer(disq, subtree, top = nil)
    top ||= disq
    render :partial => 'disqs/answer', :locals => {:disq => disq, :subtree => subtree, :top => top}
  end
end

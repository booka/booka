module DocumentClipsHelper

  def rte(id)
    <<-src
<script type="text/javascript">
  $(function() {
    $.booka.rte('#{id}');
  });
</script>
    src
  end

end

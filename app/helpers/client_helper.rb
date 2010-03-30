module ClientHelper
  def show_dialog(rendered)
     "$.booka.dialog('#{escape_javascript rendered}');"
  end
end

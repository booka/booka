module ClientHelper
  def show_dialog(rendered)
     "$.booka.dialogs.show('#{escape_javascript rendered}');"
  end
end

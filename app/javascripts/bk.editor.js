(function($) {

    var current_editor = null;
    
    var api = {
        setup : function() {
            var form = $(".editor form");
            form.attr('action', form.attr('action') + '.js');
            form.ajaxForm({
                beforeSerialize: function() {
                    if (current_editor != null) {
                        current_editor.updateElement();
                    }
                },
                success : function(responseText, statusText) {
                },
                error : function(error) {
                }
            });
        }
    };

    $.extend($.booka, {
        editor : api
    });

})(jQuery);
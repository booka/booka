(function($) {
    console.log("Booka DIALOGS");

    var current_editor = null;
    
    $.extend($.booka, {
        dialogs : {
            show : function(content) {
                $.modal.close();
                $(".dialog").html('');
                if (content != null) {
                    $.modal(content, {
                        close : true
                    });
                    $.booka.dialogs.setup();
                }
            },
            setup : function() {
                var form = $(".dialog form");
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
            },
            rte : function(id) {
                if (current_editor != null) {
                    CKEDITOR.remove(current_editor);
                }
                current_editor = CKEDITOR.replace( id , {
                    toolbar : 'BookaToolbar'
                });
            },

            load: function(token) {
                var path = $.booka.core.buildPath(token);
                $("#flash").html("<p>Cargando... <p>");
                $.getScript(path);
            }
        }
    });

    $(document).ready(function() {
        ajaxize_dialog_links();
        $.address.change(function() {
            $.booka.core.load($.address.value());
        });
    });


    $.fn.dialogs = function (fn) {
        $(this).click(function() {
            var value = fn ? fn.call(this) :
            /dialog:/.test($(this).attr('rel')) ? $(this).attr('rel').split('dialog:')[1].split(' ')[0] :
            $(this).attr('href').replace(/^#/, '');

            load_dialog(value);
            return false;
        });
    };


    var ajaxize_dialog_links = function() {
        $('a[rel*=dialog:]').live('click', function() {
            var value = /dialog:/.test($(this).attr('rel')) ? $(this).attr('rel').split('dialog:')[1].split(' ')[0] :
            $(this).attr('href').replace(/^#/, '');

            load_dialog(value);
            return false;
        })
    }
    
    var load_dialog = function(url) {
        $.modal('<div class="loading"><p>Cargando, espera un momento... </p></div>', {
            close : false
        });
        url = /\?/.test(url) ? url.replace(/\?/, '.js?') : url + ".js";
        $.getScript(url);
    }


})(jQuery);
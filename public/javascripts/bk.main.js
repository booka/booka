(function($) {

    var tokens = {
        project : "none",
        user : "none",
        browser : "none"
    }

    $.booka = {
        flash : function(message) {
            $("#flash").html("<p>" + message + "<p>");
            window.setTimeout(function() {
                $('#flash p').fadeOut('slow');
            }, 3000);
        },
        browser : function(token, content) {
            tokens.browser = token;
            $("#browser_viewport").html(content);
        },
        project : function(token, title, navigation) {
            tokens.project = token;
            $("#current_project").html(title);
            $("#site_navigation").html(navigation);
        },
        dialog : function(content) {
            $.modal.close();
            $.modal(content, {
                close : true
            });
            $.booka.dialogSetup();
        },
        dialogSetup : function() {
            var form = $(".dialog form");
            form.attr('action', form.attr('action') + '.js');
            form.ajaxForm({
                success : function(responseText, statusText) {
                },
                error : function(error) {
                }
            });
        },
        clear : function(param) {
            tokens[param] = "none";
        }
    }

    $.fn.dialogs = function (fn) {
        $(this).click(function() {
            var value = fn ? fn.call(this) :
            /dialog:/.test($(this).attr('rel')) ? $(this).attr('rel').split('dialog:')[1].split(' ')[0] :
            $(this).attr('href').replace(/^#/, '');
            
            load_dialog(value);
            return false;
        });
    };

    var load_dialog = function(url) {
        $.modal('<div class="loading">loading...</div>', {
            close : false
        });
        console.log("load dialog", url);
        url = /\?/.test(url) ? url.replace(/\?/, '.js?') : url + ".js";
        $.getScript(url);
    }

    var ajaxize = function() {
        $('a[rel*=dialog:]').live('click', function() {
            var value = /dialog:/.test($(this).attr('rel')) ? $(this).attr('rel').split('dialog:')[1].split(' ')[0] :
            $(this).attr('href').replace(/^#/, '');

            load_dialog(value);
            return false;
        })
    }


    $(function() {
        ajaxize();
        //$('a[rel*=dialog:]').dialogs();
        
        $.address.change(function(event) {
            $("#flash").html("<p>Cargando...<p>");
            $.getScript(_getPath());
        });


        var _getPath = function() {
            var path = $.address.value();
            console.log("Path: '" + path + "'")
            if (path == "/") {
                path = root_path;
            }
            var params = "";
            $.each(tokens, function(token, value) {
                params += (params == "") ? "?" : "&";
                params += token + "=" + value;
            });
            return path + ".js" + params;
        }
    });

})(jQuery);
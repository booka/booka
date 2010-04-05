(function($) {

    if (typeof console == "undefined" || typeof console.log == "undefined") {
        console = {
            log : function() {
            }
        };
    }

    var layout = {
        left: 0,
        right: 0
    }
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
        },
        layout: function(browser, comm) {
            if (browser) {
                setLayoutLeft(layout.left, layout.left);
            } else {
                setLayoutLeft(10, 0);
            }
            if (comm) {
                setLayoutRight(layout.right, layout.right);
            } else {
                setLayoutRight(10, 0);
            }
        },
        load: function(token) {
            var path = _getPath(token);
            $("#flash").html("<p>Cargando... <p>");
            $.getScript(path);
        }
    }

    var _getPath = function(path) {
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

    var setLayoutLeft = function(content, browser) {
        $("#content_viewport").css('left', content);
        $("#browser_viewport").animate({
            width: browser
        }, 500);
    }

    var setLayoutRight = function(content, browser) {
        $("#content_viewport").css('right', content);
        $("#comm_viewport").animate({
            width: browser
        }, 500);
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
        $.modal('<div class="loading">loading... </div>', {
            close : false
        });
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
        layout.left = $("#content_viewport").css('left')
        layout.right = $("#content_viewport").css('right')
        
        $.address.change(function(event) {
            $.booka.load($.address.value());
        });



    });

})(jQuery);
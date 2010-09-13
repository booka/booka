/*
 * Booka CORE Module
 *
 */
(function($) {
    if (typeof console == "undefined" || typeof console.log == "undefined") {
        console = {
            log : function() {
            }
        };
    }
    console.log("Booka CORE");

    var request_count = 0;

    var $B = $.booka = $.booka || {}
    $.extend($.booka, {
        core : {
            state : {

            },
            buildPath : function(path) {
                var params = "";
                $.each($B.core.state, function(token, value) {
                    params += (params == "") ? "?" : "&";
                    params += token + "=" + value;
                });
                return path +  ".js"  + params;
            },
            load: function(token) {
                console.log("ajax.load: '" + token + "'");
                if ( token == '/') {
                    $.address.value(root_path);
                    return;
                }
                var path = $.booka.core.buildPath(token);
                console.log("Loading path: " + path);
                $.getScript(path);
                
                $.booka.layout.flash("Cargando, espera un momento...");
                $.booka.comm.clear('flash');
                var name = token.replace(/\//g, ' > ').replace(/\d+-/g, '').replace(/-/, ' ');
                $.booka.comm.add('navigation', 'Abriendo <a href="#'+ token + '">' + name + "</a>");
                $.booka.mouse.show();
            }
        }
    });


    function setupAjax() {
        $(document).ajaxError(function(e, xhr, settings, exception) {
            var page = $('<div id="page" />');
            $('<p class="error" />').append("<h2>Lo siento se ha producido un error</h2>").append(xhr.responseText).appendTo(page);
            $("#content").append(page);
        });

        $(document).ajaxSend(function() {
            request_count++;
            console.log("SEND - Request count: " + request_count);
            $("#working").fadeIn();
        });

        $(document).ajaxComplete(function() {
            request_count--;
            console.log("COMPLETE - Request count: " + request_count);
            if (request_count == 0) {
                $("#working").fadeOut();
            }
        });
    }

    function init() {
        $.address.change(function() {
            $.booka.core.load($.address.value());
        });

        $('a[rel*=address:]').live('click', function() {
            $.address.value($(this).attr('href'));
            return false;
        });

        $("form").live('submit', function() {
            $('input[type=submit]', this).attr('disabled', 'disabled');
        });
        setupAjax();

        console.log("Core loaded.");
    }

    $(init);

})(jQuery);
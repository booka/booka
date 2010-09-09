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

    var $B = $.booka = $.booka || {}
    $.extend($.booka, {
        core : {
            state : {

            },
            buildPath : function(path) {
                if (path == "/") {
                    path = root_path;
                }
                var params = "";
                //                $.each($B.core.state, function(token, value) {
                //                    params += (params == "") ? "?" : "&";
                //                    params += token + "=" + value;
                //                });
                return path + ".js"; // + params;
            },
            load: function(token) {
                var path = $.booka.core.buildPath(token);
                console.log("Loading path: " + path);
                $("#flash").html("<p>Cargando, espera un momento... <p>");
                $.getScript(path);
            }
        }
    });


    function init() {
        $.address.change(function() {
            console.log("Loading...", $.address.value());
            $.booka.core.load($.address.value());
        });

        $('a[rel*=address:]').live('click', function() {
            $.address.value($(this).attr('href'));
            return false;
        });

        $("form").live('submit', function() {
           $('input[type=submit]', this).attr('disabled', 'disabled');
        });

        console.log("Core loaded.");
    };

    $(init);

})(jQuery);
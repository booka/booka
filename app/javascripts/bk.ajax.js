/*
 * Booka AJAX Module
 *
 */
(function($) {


    var request_count = 0;

    var api = {
        state : {

        },
        buildPath : function(path) {
            var params = "";
            $.each(api.state, function(token, value) {
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
            var path = $.booka.ajax.buildPath(token);
            console.log("Loading path: " + path);
            $.getScript(path);
                
            $.booka.layout.flash("Cargando, espera un momento...");
            $.booka.comm.clear('flash');
            var name = token.replace(/\//g, ' > ').replace(/\d+-/g, '').replace(/-/, ' ');
            $.booka.comm.add('navigation', 'Abriendo <a href="#'+ token + '">' + name + "</a>");
            $.booka.mouse.show();
        }
    }

    $.extend($.booka, {
        ajax : api
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
            $.booka.mouse.stop();
            $("#working").fadeIn();
        });

        $(document).ajaxComplete(function() {
            request_count--;
            console.log("COMPLETE - Request count: " + request_count);
            if (request_count == 0) {
                $("#working").fadeOut();
                $.booka.mouse.run();
            }
        });
    }

    function init() {
        $.address.change(function() {
            $.booka.ajax.load($.address.value());
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
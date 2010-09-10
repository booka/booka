/*
 * Booka chat
 */

(function($) {
    console.log("Booka COMM");

    var api = {
        print : function(elementClass, html) {
            add(elementClass,html,5000);
        },
        add : function(elementClass, html, time) {
            var element = $('<div class="item ' + elementClass + '">' + html + '</div>');
            $("#communicator .output").prepend(element);
            if (false && time > 0) {
                window.setTimeout(function() {
                    element.fadeOut('slow');
                }, time);
            }
        }
    };

    $.extend($.booka, {
        comm : api
    });


    var init = function() {
        $("#channel_name").val("booka");
        $("#event_name").val("message");
        var session_id = $("#event_session_id").val();

        Pusher.log = function() {
            if (window.console) window.console.log.apply(window.console, arguments);
        };

        // Create a Pusher server object with your app's key
        console.log("Init pusher: " + pusher_key);
        var socket = new Pusher(pusher_key, "booka");
        // Bind to server events
        socket.bind("message", function(data) {
            if (data.session_id != session_id) {
                api.add("message", data.body, 0);
                print('anónimo', data.body);
            }
        });

        socket.bind("activity", function(data) {
            console.log("Pusher activity")
           api.add("activity", data.body, 0);
        });

        socket.bind('connection_established', function(evt){
            api.add("flash", "Conectado a plataformabooka.net", 5000);
            $.ajaxSetup({
                data: {
                    socket_id: evt.socket_id
                }
            });
        });


        $("#communicator .input form").ajaxForm({
            beforeSubmit: function() {
                print('yo', $("#event_body").val());
                $("#event_body").val('').focus();
            }
        });
    };

    $(init);


})(jQuery);


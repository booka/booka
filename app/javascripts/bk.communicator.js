/*
 * Booka chat
 */

(function($) {
    console.log("Booka COMM");

    var channel_name = "booka";
    var event_name = "message";

    function print(username, body) {
        var user = username != null ? "<label>" + username + ":&nbsp;</label>" : '';
        $("#communicator .output").append('<div class ="message">' + user + body + "</div>");
    }

    var init = function() {
        $("#communicator .output").empty();//.append("<div>Conectando...</div>")
        $("#channel_name").val(channel_name);
        $("#event_name").val(event_name);
        print(null, "Conectando...");

        var session_id = $("#event_session_id").val();

        Pusher.log = function() {
            if (window.console) window.console.log.apply(window.console, arguments);
        };

        // Create a Pusher server object with your app's key
        var socket = new Pusher('10b14a3b8e2d5abdb762', channel_name);
        // Bind to server events
        socket.bind(event_name, function(data) {
            console.log("JODER: ", data.body);
            if (data.session_id != session_id) {
                print('anónimo', data.body);
            }
        });
        socket.bind('connection_established', function(evt){
            print(null, 'Chat listo.')
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

    //$(init);


})(jQuery);

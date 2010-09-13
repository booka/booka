(function($) {
    console.log("Booka MOUSE");

    var stop_timeout = false;
    var visible = true;

    var api = {
        show : function () {
            clearTimeout(stop_timeout);
            if (!visible) {
                $("#site_navigation").fadeIn();
                $("#user_navigation").fadeIn();
                $("#bgnavigation").fadeIn();
                $("#browser_viewport").fadeIn();
                $("#comm_viewport").fadeIn();
                visible = true;
            }
        },
        hide  : function() {
            if (visible) {
                $("#site_navigation").fadeOut();
                $("#user_navigation").fadeOut();
                $("#bgnavigation").fadeOut();
                $("#browser_viewport").fadeOut('slow');
                $("#comm_viewport").fadeOut('slow');
                visible = false;
            }
        }
    };

    $.extend($.booka, {
        mouse : api
    });
    
    $(function() {
        api.show();
        $("#content").hover(function() {
            console.log("Content IN");
            api.show();
            stop_timeout = setTimeout(function() {
                if (visible) {
                    api.hide();
                }
            }, 2000);
        }, function() {
            console.log("Content OUT");
            api.show();
        });

        $("#nocontent").mousemove(function() {
            api.show();
            stop_timeout = setTimeout(function() {
                if (visible && should_hide) {
                    api.hide();
                }
            }, 2000);
        });
    });

})(jQuery);
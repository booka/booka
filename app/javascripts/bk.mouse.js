(function($) {
    console.log("Booka MOUSE");


    var stop_timeout = false;
    var visible = true;
    $(function() {
        //$("#navigation").hide();
        $("#browser_viewport").hide();
        $("#comm_viewport").hide();
        visible = false;
        
        $(document).mousemove(function() {
            clearTimeout(stop_timeout);
            if (!visible) {
                //$("#navigation").fadeIn();
                $("#browser_viewport").fadeIn();
                $("#comm_viewport").fadeIn();
                visible = true;
            }
            stop_timeout = setTimeout(function() {
                if (visible) {
                    //$("#navigation").fadeOut();
                    $("#browser_viewport").fadeOut('slow');
                    $("#comm_viewport").fadeOut('slow');
                    visible = false;
                }
            }, 4000);
        });
    });

})(jQuery);
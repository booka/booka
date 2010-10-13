(function($) {

    var tokens = $.booka.ajax.state;

    $.extend(tokens, {
        user_id : null
    });

    var api = {
        /**
         * Set the user. If the id is null removes the current user
         */
        set : function(id, label, url) {
            tokens.user_id = id;
            $("#current_user").html('<a href="#" rel="' + url + '">' + label + '</a>');
        },
        setProject : function(title, url) {
            $("#current_project").text(title).attr('href', url);

        }
    };

    $.extend($.booka, {
        user : api
    });

})(jQuery);
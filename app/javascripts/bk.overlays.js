(function($) {

    $.booka = $.booka || {}

    $.extend($.booka, {
        tooltip : function(anchor_id, content) {
            var tooltip_id = anchor_id + '-tooltip';
            $('#' + tooltip_id).remove();
            $(content).attr('id', tooltip_id).appendTo("body");

            var tooltip = $('#' + anchor_id).tooltip({
                effect: 'fade',
                tip: '#' + tooltip_id,
                position : "bottom center",
                api : true
            });
            tooltip.show();
            window.setTimeout(function() {
                tooltip.hide();
            }, 4000);
        }
    });

})(jQuery);
/*
 * Booka LAYOUT Module
 */
(function($) {
    console.log("Booka LAYOUT Module");

    var layout = {
        left: 0,
        right: 0
    }
    var tokens = $.booka.core.state;
    
    $.extend(tokens, {
        browser : 'none',
        project : 'none'
    });

    $.extend($.booka, {
        layout : {
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
            clear : function(param) {
                tokens[param] = "none";
            },
            set: function(browser, comm) {
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
            }
        }
    });

    $(function() {
        layout.left = $("#content_viewport").css('left')
        layout.right = $("#content_viewport").css('right')
    })



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


})(jQuery);
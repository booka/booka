/*
 * Booka LAYOUT Module
 */
(function($) {
    console.log("Booka LAYOUT Module");

    var layout = {
        left: 0,
        right: 0
    }

    var current_browser = null;

    var tokens = $.booka.core.state;
    var place = null;
    
    $.extend(tokens, {
        browser : 'none',
        project : 'none'
    });

    $.extend($.booka, {
        layout : {
            place : function(new_place) {
                place = new_place;
                $('#place').html(place);
            },
            flash : function(message) {
                $("#flash").html("<p>" + message + "<p>");
                window.setTimeout(function() {
                    $('#flash p').fadeOut('slow');
                }, 3000);
            },
            document : function(content) {
                $("#content").html(content);
            },
            browser : function(token, content) {
                current_browser = token;
                if (content != null) {
                    $("#browser_viewport").html(content);
                }
            },
            requestBrowser : function(token, path) {
                console.log("Requested browser : " + token + " current: " + current_browser);
                if (current_browser == null) {
                    console.log("Request browser: " + token + " - " + path);
                    $.getScript(path + ".js");
                }
            },
            project : function(token, title, navigation) {
                tokens.project = token;
                $("#current_project").html(title);
                $("#site_navigation").html(navigation);
            },
            userNavigation : function(navigation) {
                $("#user_navigation").html(navigation);
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
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
    var place = null;
    
    $.extend(tokens, {
        browser : null,
        project : null
    });

    var api = {
        place : function(new_place) {
            place = new_place;
            $('#place').html(place);
        },
        flash : function(message) {
            $("#flash").html("<p>" + message + "<p>");
            $.booka.comm.add('flash', message, 0);
            window.setTimeout(function() {
                $('#flash p').fadeOut('slow');
            }, 3000);
        },
        document : function(content) {
            $("#content").html(content).scrollTop(0);
        },
        preDocument : function(content) {
            $("#content").prepend(content);
        },
        browser : function(token, content) {
            console.log("Set browser " + token);
            tokens.browser = token;
            if (content != null) {
                $("#browser_viewport").html(content);
            } else {
                $("#browser_viewport").html('');
            }
        },
        requestBrowser : function(token, path) {
            console.log("Requested browser : " + token + " current: " + tokens.browser);
            if (tokens.browser == null) {
                console.log("Request browser: " + token + " - " + path);
                $.getScript(path + ".js");
            }
        },
        project : function(token, title, navigation) {
            $.booka.comm.clear('project');
            if (token == null) {
                tokens.project = null;
                $("#current_project").html('');
                $("#site_navigation").html('');
            } else if (tokens.project != token) {
                $.booka.comm.add('project', "Acabas de abrir la investigación '" + title + "'.", 5000);
                tokens.project = token;
                $("#current_project").html(title);
                $("#site_navigation").html(navigation);
            }
        },
        projectStages : function(html) {
        //$("#content").html(html);
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

    $.extend($.booka, {
        layout : api
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
/* global jQuery*/
(function($) {
 
    $.fn.toPostLink = function() {
        var escapeHTML = function(html) {
            return $('<div>').text(html).html();
        };
 
        $(this).click(function() {
            var href = $(this).attr("href").split("#")[0].split("?", 2);
            var path = href[0];
            var query = href[1] || "";
 
            var form = $("<form method='post' action='" + escapeHTML(path) + "'>").appendTo($("body"));
 
            // query parameters.
            $.each(query.split("&"), function() {
                var pair = this.split("=");
                var name = decodeURIComponent(pair[0]);
                var value = decodeURIComponent(pair[1]);
                $("<input type='hidden' name='" + escapeHTML(name) + "' value='" + escapeHTML(value) + "' />").appendTo(form);
            });
 
            // csrf token.
            var csrf_token = $('meta[name=csrf-token]').attr('content');
            var csrf_param = $('meta[name=csrf-param]').attr('content');
            if (csrf_param !== undefined && csrf_token !== undefined) {
                $("<input type='hidden' name='" + escapeHTML(csrf_param) + "' value='" + escapeHTML(csrf_token) + "' />").appendTo(form);
            }
 
            form.submit();
 
            return false;
        });
    };
 
})(jQuery);
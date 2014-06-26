$( function () {

    var relative_path = window.location.pathname;

    var container = $.sammy(function() {
        this.element_selector = '#container';

        this.get(relative_path, function (context) {
            for (var i =0; i < data.length; i++) {
                if (data[i]['name'] === config.first_page) {
                    break;
                }
            }
            context.app.swap(data[i]['html'])
        });

        this.get(relative_path + '#' + '/(.*)', function (context) {
            var dhash = document.location.hash;
            post_name = dhash.substring(2);
            for (var i =0; i < data.length; i++) {
                if (data[i]['name'] === post_name) {
                    break;
                }
            }
            context.app.swap(data[i]['html'])
        });

    });

    // Enable router for container
    container.run()

    // Add Smooth Scrolling
    // http://css-tricks.com/snippets/jquery/smooth-scrolling/

    $('a[href*=#]:not([href=#])').click(function() {
        if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
            var target = $(this.hash);
            target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
            if (target.length) {
                $('html,body').animate({
                    scrollTop: target.offset().top
                }, 1000);
                return false;
            }
        }
    });
});

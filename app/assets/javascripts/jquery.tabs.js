/**
 * jquery.tabs.js
 *
 * university:  University of Applied Sciences Salzburg
 * studie:      MultiMediaTechnology
 * usage:	    Multimediaprojekt 2a (MMP2a)
 * author:      - Thomas Mayrhofer (thomas@mayrhofer.at)
 *
 * About this file:
 * ----------------
 * this is a simple jquery plugin for changing the sidebar menu
 */


(function($) {
    var Tabs = function(element, options) {
        this.$element = element;
        this.$links = this.$element.find("a");
        this.$container = $(options.wrapper);
        this.$element.addClass('jquery-tabs');

        this.$links.on('click', this.clickHandler.bind(this));
    };

    Tabs.prototype.clickHandler = function(evt) {
        evt.preventDefault();

        var $currentTarget = $(evt.currentTarget);
        var targetID = $currentTarget.attr('href');
        var activeElement = this.$container.find(".active");
        var targetElement = $(targetID);

        this.$links.removeClass("active");
        $currentTarget.addClass("active");

        activeElement.removeClass("active");
        targetElement.addClass("active");

//        activeElement.animate({
//            opacity: 0
//        }, 300, function() {
//            activeElement.removeClass("active");
//            targetElement.animate({
//                opacity: 1
//            }, function() {
//                targetElement.addClass("active");
//            });
//        });
    };

    $.fn.Tabs = function(options) {
        return this.each(function() {
            var $this = $(this);
            var data = $this.data('Tabs');
            if (!data) {
                $this.data('Tabs', (data = new Tabs($this, options)));
            }
        });
    };
})(jQuery);
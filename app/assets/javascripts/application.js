// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .



$(document).ready(function() {
    var menu_bar = $('#bs-example-navbar-collapse-1'),
        menu_button = $('.navbar-toggle'),
        aria = 'aria-expanded';
    menu_button.unbind('click');
    //menu_bar.addClass('collapse navbar-collapse');
    menu_button.on('click',function(e) {
        if ($(this).attr(aria) == "true") {
            $(this).attr(aria, 'false');
            menu_bar.removeClass('collapse navbar-collapse in').addClass('collapse navbar-collapse');
            menu_bar.attr(aria, 'false');
        }
        else {
            $(this).attr(aria, 'true');
            menu_bar.removeClass('collapse navbar-collapse').addClass('collapse navbar-collapse in');
            menu_bar.attr(aria, 'true');
        }
        e.preventDefault();
        menu_bar.toggle('slow');
    });
});

$(window, document, undefined).ready(function() {

    $('input').blur(function() {
        var $this = $(this);
        if ($this.val())
            $this.addClass('used');
        else
            $this.removeClass('used');
    });

    var $ripples = $('.ripples');

    $ripples.on('click.Ripples', function(e) {

        var $this = $(this);
        var $offset = $this.parent().offset();
        var $circle = $this.find('.ripplesCircle');

        var x = e.pageX - $offset.left;
        var y = e.pageY - $offset.top;

        $circle.css({
            top: y + 'px',
            left: x + 'px'
        });

        $this.addClass('is-active');

    });

    $ripples.on('animationend webkitAnimationEnd mozAnimationEnd oanimationend MSAnimationEnd', function(e) {
        $(this).removeClass('is-active');
    });
    
   
});

// $(document).ready(function() {
//      $('.button').click(function (e) {
//         // alert(1)
//         e.preventDefault();
//         $('.button').parent().toggleClass('expand');
//         $('.button').parent().children().toggleClass('expand');
//     });
// });
$(window, document, undefined).ready(function() {

    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });

    $("#all-requests").show();
    $('#help-page').hide();

    $("#view-dashboard").click(function(e) {
        e.preventDefault();
        $("#all-requests").show();
        $('#help-page').hide();
    });

    $("#view-tutorial").click(function(e) {
        e.preventDefault();
        $("#all-requests").hide();
        $('#help-page').show();
    });

    $('.status-message').hide();

    $('.edit-button').on('click', function() {
        $(this).parent().parent().fadeOut(300);
        $(this).parent().parent().parent().find('.status-message.approved').delay(300).fadeIn(300);
    });

    $('.delete-button').on('click', function() {
        $(this).parent().parent().fadeOut(300);
        $(this).parent().parent().parent().find('.status-message.declined').delay(300).fadeIn(300);
    });

    $('.button.buttonBlue').on('click', function() {
        var loc = $('#location-select').val();
        $('table tbody tr td:nth-child(2)').each(function(idx,elem) {
            if (loc != "ALL LOCATIONS" && elem.textContent != loc) {
                $(elem).parent().hide();
            } else {
                $(elem).parent().show();
            }
        });
    });

    var locations = ["ALL LOCATIONS", "101 BARKER", "118 BARROWS", "122 BARROWS", "126 BARROWS", "166 BARROWS", "170 BARROWS", "56 BARROWS", "60 BARROWS", "50 BIRGE", "241 CORY", "277 CORY", "289 CORY", "155 DONNER LAB", "145 DWINELLE", "155 DWINELLE", "160 DWINELLE", "219 DWINELLE", "3106 ETCHEVERRY", "3107 ETCHEVERRY", "3108 ETCHEVERRY", "3109 ETCHEVERRY", "3111 ETCHEVERRY", "3113 ETCHEVERRY", "10 EVANS", "60 EVANS", "141 GIANNINI", "100 GPB", "390 HEARST MINING", "155 KROEBER", "120 LATIMER", "1 LECONTE", "2 LECONTE", "3 LECONTE", "4 LECONTE", "245 LI KA SHING", "141 MCCONE", "101 MOFFITT", "102 MOFFITT", "103 MOFFITT", "106 MOFFITT", "145 MOFFITT", "101 MORGAN", "109 MORGAN", "159 MULFORD", "240 MULFORD", "105 NORTH GATE", "1 PIMENTEL", "105 STANLEY", "106 STANLEY", "180 TAN", "2040 VLSB", "2050 VLSB", "2060 VLSB", "150 WHEELER", "213 WHEELER", "102 WURSTER"]
    $.each(locations, function(idx,elem) {
        $('#location-select').append('<option value="' + elem + '">' + elem + '</option>');
    });

    $('input').on("blur", function() {
      var $this = $(this);
      if ($this.val())
        $this.addClass('used');
      else
        $this.removeClass('used');
    });

    $( '.group.checklist' ).on( 'click', 'input[type="checkbox"]', function () {
      $( this ).next('span').toggleClass( 'check_select', this.checked );
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

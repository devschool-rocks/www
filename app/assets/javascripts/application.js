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
//= require bootstrap.min
//= require smooth-scroll.min
//= require slick.min
//= require clickdesk

//= require_tree .
//= require_self

smoothScroll.init();

$(document).ready(function() {

  $('.slide').slick({
    autoplay: true,
    accessibility: true,
    draggable: true,
    autoplaySpeed: 10000
  });

  $('.navbar-nav a[href="' + this.location.pathname + '"]')
    .addClass('active');

  if( $('.navbar-nav a.active').length == 0 ) {
    $(".navbar-nav a.default-active")
      .addClass('active');
  }
});

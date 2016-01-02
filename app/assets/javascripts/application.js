//= require jquery
//= require bootstrap.min
//= require smooth-scroll.min
//= require slick.min
//= require clickdesk.min
//= require hotjar.min
//= require ganalytics.min

//= require_tree .

smoothScroll.init();

$(document).ready(function() {

  $('.slide').slick({
    autoplay: true,
    accessibility: true,
    draggable: true,
    autoplaySpeed: 10000
  });

  if (new RegExp(/\/blog/).exec(this.location.pathname) != null) {
    $('.navbar-nav a[href="/blog"').addClass('active');
  } else {
    $('.navbar-nav a[href="' + this.location.pathname + '"]')
      .addClass('active');
  }

  if( $('.navbar-nav a.active').length == 0 ) {
    $(".navbar-nav a.default-active")
      .addClass('active');
  }
});

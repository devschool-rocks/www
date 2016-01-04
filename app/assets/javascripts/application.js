//= require jquery
//= require bootstrap.min
//= require smooth-scroll.min
//= require clickdesk.min
//= require ganalytics.min

//= require_tree .

smoothScroll.init();

$(document).ready(function() {

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

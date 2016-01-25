//= require jquery
//= require bootstrap.min
//= require smooth-scroll.min
//= require js.cookie
//= require rate_it.min

//= require_tree .

smoothScroll.init();

$(document).ready(function() {

  if (new RegExp(/\/blog/).exec(this.location.pathname) != null) {
    $('.navbar-nav a[href="/blog"').addClass('active');
  } else {
    $('.navbar-nav a[href="' + this.location.pathname + '"]')
      .addClass('active');
  }

  $(window).scroll(function() { // check if scroll event happened
    if ($(document).scrollTop() > $("header").height()-20) { // check if user scrolled more than 50 from top of the browser window
      $(".navbar-fixed-top").css("background-color", "rgba(0,0,0,.5");
    } else {
      $(".navbar-fixed-top").css("background-color", "transparent");
    }
  });


  if( $('.navbar-nav a.active').length == 0 ) {
    $(".navbar-nav a.default-active")
      .addClass('active');
  }
});

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

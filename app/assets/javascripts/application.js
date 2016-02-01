//= require jquery
//= require bootstrap.min
//= require smooth-scroll.min
//= require js.cookie
//= require rate_it.min
//= require formValidation.min
//= require formValidationBootstrapFramework.min
//= require countdown.min

//= require_tree .

smoothScroll.init();


Date.prototype.getSecondMonday = function () {
  var d = new Date (this.getFullYear(), this.getMonth(), 1, 0, 0, 0);
  d.setDate(d.getDate() + 15 - d.getDay());
  return d;
}

jQuery(document).ready(function() {
  var d = new Date().getSecondMonday();
  $('#countdown_dashboard').countDown({
    targetDate: {
      'day':   d.getDay()+1,
      'month': d.getMonth()+1,
      'year':  d.getYear()+1900,
      'hour':  0,
      'min':   0,
      'sec':   0
    }
  });
});

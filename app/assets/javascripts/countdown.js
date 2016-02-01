! function(a) {
    a.fn.countDown = function(t) {
        return config = {}, a.extend(config, t), diffSecs = this.setCountDown(
            config), config.onComplete && a.data(a(this)[0], "callback",
            config.onComplete), config.omitWeeks && a.data(a(this)[0],
            "omitWeeks", config.omitWeeks), a("#" + a(this).attr("id") +
            " .digit").html(
            '<div class="top"></div><div class="bottom"></div>'), a(
            this).doCountDown(a(this).attr("id"), diffSecs, 500), this
    }, a.fn.stopCountDown = function() {
        clearTimeout(a.data(this[0], "timer"))
    }, a.fn.startCountDown = function() {
        this.doCountDown(a(this).attr("id"), a.data(this[0], "diffSecs"),
            500)
    }, a.fn.setCountDown = function(t) {
        var e = new Date;
        t.targetDate ? e = new Date(t.targetDate.month + "/" + t.targetDate
            .day + "/" + t.targetDate.year + " " + t.targetDate.hour +
            ":" + t.targetDate.min + ":" + t.targetDate.sec + (t.targetDate
                .utc ? " UTC" : "")) : t.targetOffset && (e.setFullYear(
                t.targetOffset.year + e.getFullYear()), e.setMonth(t.targetOffset
                .month + e.getMonth()), e.setDate(t.targetOffset.day +
                e.getDate()), e.setHours(t.targetOffset.hour + e.getHours()),
            e.setMinutes(t.targetOffset.min + e.getMinutes()), e.setSeconds(
                t.targetOffset.sec + e.getSeconds()));
        var s = new Date;
        return diffSecs = Math.floor((e.valueOf() - s.valueOf()) / 1e3), a.data(
            this[0], "diffSecs", diffSecs), diffSecs
    }, a.fn.doCountDown = function(s, i, o) {
        $this = a("#" + s), 0 >= i && (i = 0, a.data($this[0], "timer") &&
                clearTimeout(a.data($this[0], "timer"))), secs = i % 60,
            mins = Math.floor(i / 60) % 60, hours = Math.floor(i / 60 / 60) %
            24, 1 == a.data($this[0], "omitWeeks") ? (days = Math.floor(i /
                60 / 60 / 24), weeks = Math.floor(i / 60 / 60 / 24 / 7)) :
            (days = Math.floor(i / 60 / 60 / 24) % 7, weeks = Math.floor(i /
                60 / 60 / 24 / 7)), $this.dashChangeTo(s, "seconds_dash",
                secs, o ? o : 800), $this.dashChangeTo(s, "minutes_dash",
                mins, o ? o : 1200), $this.dashChangeTo(s, "hours_dash",
                hours, o ? o : 1200), $this.dashChangeTo(s, "days_dash",
                days, o ? o : 1200), $this.dashChangeTo(s, "weeks_dash",
                weeks, o ? o : 1200), a.data($this[0], "diffSecs", i), i >
            0 ? (e = $this, t = setTimeout(function() {
                $("div#countdown_dashboard").doCountDown(s, i - 1)
            }, 1e3), a.data(e[0], "timer", t)) : (cb = a.data($this[0],
                "callback")) && a.data($this[0], "callback")()
    }, a.fn.dashChangeTo = function(t, e, s, i) {
        $this = a("#" + t);
        for (var o = $this.find("." + e + " .digit").length - 1; o >= 0; o--) {
            var n = s % 10;
            s = (s - n) / 10, $this.digitChangeTo("#" + $this.attr("id") +
                " ." + e + " .digit:eq(" + o + ")", n, i)
        }
    }, a.fn.digitChangeTo = function(t, e, s) {
        s || (s = 800), a(t + " div.top").html() != e + "" && (a(t +
            " div.top").css({
            display: "none"
        }), a(t + " div.top").html(e ? e : "0").slideDown(s), a(t +
            " div.bottom").animate({
            height: ""
        }, s, function() {
            a(t + " div.bottom").html(a(t + " div.top").html()),
                a(t + " div.bottom").css({
                    display: "block",
                    height: ""
                }), a(t + " div.top").hide().slideUp(10)
        }))
    }
}(jQuery);

Date.prototype.getSecondMonday = function () {
  var d = new Date (this.getFullYear(), this.getMonth(), 1, 0, 0, 0);
  d.setDate(d.getDate() + 15 - d.getDay());
  return d;
}

$(document).ready(function() {
  var d = new Date().getSecondMonday();
  $('#countdown_dashboard').countDown({
    targetDate: {
      'day':   d.getDate()+1,
      'month': d.getMonth()+1,
      'year':  d.getYear()+1900,
      'hour':  0,
      'min':   0,
      'sec':   0
    }
  });
});

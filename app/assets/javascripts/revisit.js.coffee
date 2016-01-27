$(document).ready ->
  today = new Date().getDate()
  lastVisit = Cookies.get('last-visit')
  visitCount = (parseInt(Cookies.get('visit-count')) || 0) + 1

  Cookies.set('last-visit', today, { expires: 7 })
  Cookies.set('visit-count', 1, { expires: 31 })

  if lastVisit > (today + 1)
    Cookies.set('visit-count', visitCount, { expires: 31 })

  if visitCount > 1
    console.debug("awesome, repeat viewer (dif days)")
    modal = $("#repeat_viewer_#{visitCount}")
    if modal.length > 0
      if !Cookies.get('free-session-claimed')
        $("#repeat_viewer_#{visitCount}").show()

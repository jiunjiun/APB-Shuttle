now = new Date()
now_hour = now.getHours()
now_min = now.getMinutes()
now_seconds = now.getSeconds()

depart = document.getElementsByClassName("recent_depart")[0].innerHTML.trim().split(':');
depart_hour = parseInt(depart[0])
depart_min  = parseInt(depart[1])

depart_hour = now_hour+1 if depart_hour == 0 && now_hour == 23
compare = (depart_hour - now_hour) * 60 + (depart_min - now_min)

refresh_ms = compare * 60 * 1000 - ((now_seconds) * 60)

if refresh_ms > 30 * 1000
  setTimeout (->
    location.href = '/'
    return
  ), refresh_ms


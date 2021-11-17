on ME:*:JOIN:%ch: {
  if $asctime(HH:nn:ss) >= 05:00:00 && $asctime(HH:nn:ss) <= 11:59:59 goto 2
  if $asctime(HH:nn:ss) >= 12:00:00 && $asctime(HH:nn:ss) <= 16:59:59 goto 3  
  if $asctime(HH:nn:ss) >= 17:00:00 && $asctime(HH:nn:ss) <= 23:59:59 goto 4
  if $asctime(HH:nn:ss) >= 00:00:00 && $asctime(HH:nn:ss) <= 04:59:59 goto 4 
  halt
  :1
  halt
  :2
  timer 1 2 msg $chan Good morning everyone ;) 
  halt 
  :3
  timer 1 2 msg $chan Good afternoon everyone ;) 
  halt 
  :4
  timer 1 2 msg $chan Good evening everyone ;)
  halt
}

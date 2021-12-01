menu channel {
  .*OnJoin Greet*
  ..Add Channel: set %ch. $+ $network $addtok($eval($+(%,ch.,$network),2),#,44) | echo -a 40* OnJoin Channel Greet Added to Channel: # in $network Network
  ..Del Channel: set %ch. $+ $network $remtok($eval($+(%,ch.,$network),2),#,1,44) | echo -a 40* OnJoin Channel Greet Removed from to Channel # in $network Network
  ..-
  ..Enable: set %greet. $+ $network $addtok($eval($+(%,greet.,$network),2),$1,44 ,$style(2)) on | echo -a 40* OnJoin Channel Greet is Enabled for $network Network
  ..Disable: unset %greet. $+ $network $addtok($eval($+(%,greet.,$network),2),1,44 ,$style(2))  | echo -a 40* OnJoin Channel Greet is Disabled $for $network Network
  ..-
  ..Status { if ($eval($+(%,greet.,$network),2) == on ) echo 4Auto Greet for $network is ON | else echo -a 4Auto Greet for $network is OFF }
  ..Channel List  { if (%greet. [ $+ [ $network ] ] == on) echo -a 4List of active channel $eval($+(%,ch.,$network),2) $+ ! | else echo -a 4Auto Greet is inactive in this Network.}
  }
}

on me:*:join:$($eval($+(%,ch.,$network),2)): {
    if ($eval($+(%,greet.,$network),2) == on) {
      if ($time >= 05:00:00) && ($time <= 11:59:59) { timer 1 2 msg $chan Good Morning everyone ;) | halt }
      if ($time >= 12:00:00) && ($time <= 16:59:59) { timer 1 2 msg $chan Good Afternoon everyone ;)  | halt }
      if ($time >= 17:00:00) && ($time <= 23:59:59) { timer 1 2 msg $chan Good Evening everyone ;) | halt }
      if ($time >= 00:00:00) && ($time <= 04:59:59) { timer 1 2 msg $chan Good Evening everyone ;) | halt } 
    }
  }

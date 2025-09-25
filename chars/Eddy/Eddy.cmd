[Statedef -1]

;===========================================================================


;===========================================================================
;This is not a move, but it sets up var(1) to be 1 if conditions are right
;for a combo into a special move (used below).
;Since a lot of special moves rely on the same conditions, this reduces
;redundant logic.
[State -1, Combo condition Reset]
type = VarSet
trigger1 = 1
var(1) = 0

[State -1, Combo condition Check]
type = VarSet
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = [200,499]
trigger2 = movecontact ;&& enemynear, movetype = H
trigger2 = stateno!=421
trigger3 = stateno = 1330 ;From blocking
trigger4 = stateno = 105 && time > 10
trigger5 = stateno = 1203
var(1) = 1

[State -1, Grab]
type = ChangeState
value = 800
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
trigger1 = command = "throwtech"
trigger1 = statetype != A
trigger1 = ctrl


;Triple Kung Fu Palm (uses one super bar)
[State -1, Triple Kung Fu Palm]
type = ChangeState
value = 3000
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "TripleKFPalm"
triggerall = power >= 2000
triggerall = stateno != 3000
triggerall = stateno != 3001
triggerall = stateno != 3004
triggerall = statetype != A
trigger1 = ctrl
trigger2 = hitdefattr = SC, NA, SA, HA && movecontact
trigger2=movecontact
trigger3 = (stateno = [200,499]) && movecontact ;&& enemynear, movetype = H
trigger4 = stateno = 1303 || stateno = 1313 
trigger4 = enemy,movetype=H


;---------------------------------------------------------------------------
;Triple Kung Fu Palm (uses one super bar)
[State -1, Triple Kung Fu Palm]
type = ChangeState
value = 3010
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "SmashKFUpper"
triggerall = power >= 2000
triggerall = stateno != 3000
triggerall = stateno != 3001
triggerall = stateno != 3004
triggerall = statetype != A
trigger1 = ctrl
trigger2 = hitdefattr = SCA, NA, SA && movecontact
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 1303 || stateno = 1313 
trigger4 = enemy,movetype=H
triggerall = stateno != 3010

;---------------------------------------------------------------------------
;Triple Kung Fu Palm (uses one super bar)
[State -1, Triple Kung Fu Palm]
type = ChangeState
value = 3015
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "SmashKFUpper"
triggerall = power >= 2000
triggerall = stateno != 3000
triggerall = stateno != 3001
triggerall = stateno != 3004
triggerall=stateno!=750
triggerall = statetype = A
trigger1 = ctrl
trigger2 = hitdefattr = SCA, NA, SA && movecontact
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 1303 || stateno = 1313 
trigger4 = enemy,movetype=H
triggerall = stateno != 3010
;===========================================================================

[State -1,DJC]
type = ChangeState
value = 45
triggerall = statetype=A
triggerall = command = "holdup"
triggerall = stateno != 11 && stateno!=45 && stateno!=46 && stateno!= 4260 && (stateno!=[4000,4099])
;triggerall = var(45)>0
triggerall = var(29)>0
trigger1 = ctrl && stateno!=45 && stateno!=46 && stateno!=50 && stateno!=40 && stateno!= 4260
trigger2 = movecontact ;&& enemynear, movetype = H
trigger2 = hitdefattr = A, NA
trigger3 =  stateno=45 || stateno=46|| stateno=50
trigger3 = vel y>.1

;
;---------------------------------------------------------------------------
;Aerial Dash
[State -1, Airdash]
type = ChangeState
value =904
triggerall = command = "aFF" || (command = "dash" && teammode !=tag) || (command = "dash" && teammode=tag && partner,stateno=5150)
triggerall = command != "holdback" 
trigger1 = statetype = A
trigger1 = ctrl
triggerall = stateno!=904
triggerall = var(29)>0
triggerall = (pos y<-30 && vel y < 0) || (vel y >=0)
;Aerial Backdash
[State -1, Air Backdash]
type = ChangeState
value =903
triggerall = command = "aBB" || (command = "dash" && teammode !=tag) || (command = "dash" && teammode=tag && partner,stateno=5150)
triggerall = command = "holdback" 
trigger1 = statetype = A
trigger1 = ctrl
triggerall = stateno!=903
triggerall = var(29)>0
triggerall = (pos y<-30 && vel y < 0) || (vel y >=0)

;---------------------------------------------------------------------------
[State -1, JC]
type = ChangeState
value = 40
triggerall = statetype!=A
triggerall = command = "holdup"
triggerall = movehit 
triggerall = stateno!=[1300,1313]
trigger1 = stateno = 220||210||211||420||1101

;---------------------------------------------------------------------------
[State -1, EX 6S]
type = ChangeState
value = 1120
triggerall=map(EXLimiter1)=0
triggerall = roundstate = 2 ;only attack during the round
triggerall = power>=1000
triggerall=stateno!=40
triggerall = command = "EX"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=105
;---------------------------------------------------------------------------
[State -1, 6S]
type = ChangeState
value = 1100
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "b"
triggerall = command != "c"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=105
;trigger3 = stateno = 100

;---------------------------------------------------------------------------
[State -1, EX 2S]
type = ChangeState
value = 1310
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = !numexplod(924681) ;this is the new ex limiter
triggerall = power>=1000
triggerall = command = "EX"
triggerall = command = "holddown"
triggerall = command != "holdback"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=105

;---------------------------------------------------------------------------
[State -1, EX j2S]
type = ChangeState
value = 1315
triggerall = stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = !numexplod(924681) ;this is the new ex limiter
triggerall = power>=1000
triggerall = command = "EX"
triggerall = command = "holddown"
triggerall = command != "holdback"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 =movecontact
trigger2 = hitdefattr = A, NA
;---------------------------------------------------------------------------
[State -1, 2S]
type = ChangeState
value = 1300
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "b"
triggerall = command != "c"
triggerall = command = "holddown"
triggerall = command != "holdback"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=105
;trigger3 = stateno = 100

;---------------------------------------------------------------------------
[State -1, j2S]
type = ChangeState
value = 1305
triggerall = stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "b"
triggerall = command != "c"
triggerall = command = "holddown"
triggerall = command != "holdback"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 =movecontact
trigger2 = hitdefattr = A, NA
;---------------------------------------------------------------------------
[State -1, EX 4S]
type = ChangeState
value = 1200
triggerall=map(EXLimiter2)=0
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = power>=1000
triggerall = command = "EX"
triggerall = command = "holdback"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=105
;trigger4 = stateno = 100
;---------------------------------------------------------------------------
[State -1, 4S]
type = ChangeState
value = 1000
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "b"
triggerall = command != "c"
triggerall = command = "holdback"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=105
;trigger3 = stateno = 100

;---------------------------------------------------------------------------
[State -1, EX 5S]
type = ChangeState
value = 1510
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = !numexplod(924680) ;this is the new ex limiter
triggerall = power>=1000
triggerall = command = "EX"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=105
;trigger3 = stateno = 1001 || stateno = 1002 || stateno = 1101|| stateno = 1102
;trigger3 = movecontact ;&& enemynear, movetype = H
;trigger4 = stateno = 100
;---------------------------------------------------------------------------

[State -1, 5S]
type = ChangeState
value = 1500
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "b"
triggerall = command != "c"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=105
;trigger3 = stateno = 100

[State -1, 2R: Comb Toss]
type = ChangeState
value = 1050
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = !numhelper(1052)=1
triggerall = command = "c"
triggerall = command != "b"
triggerall = command = "holddown"
triggerall = command != "holdback"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact ;&& enemynear, movetype = H
trigger3 = (stateno = 210) && movecontact ;&& enemynear, movetype = H
trigger4 = (stateno = 211) && movecontact ;&& enemynear, movetype = H
trigger5 = (stateno = 220) 
trigger5 = movecontact ;&& enemynear, movetype = H
trigger6 = (stateno = 1203) 
trigger7 = stateno = 100 
trigger8 = (stateno = [400,499]) 
trigger8 = movecontact ;&& enemynear, movetype = H
trigger9 = stateno = 1102 && movehit =1 ;&& enemynear, movetype = H

[State -1, 5R]
type = ChangeState
value = 250
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "c"
triggerall = command != "b"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact ;&& enemynear, movetype = H
trigger3 = (stateno = 210) && movecontact ;&& enemynear, movetype = H
trigger4 = (stateno = 211) && movecontact ;&& enemynear, movetype = H
trigger5 = (stateno = 220) 
trigger5 = movecontact ;&& enemynear, movetype = H
trigger6 = (stateno = 1203) 
trigger7 = stateno = 100 
trigger8 = (stateno = [400,499]) 
trigger8 = movecontact ;&& enemynear, movetype = H

;---------------------------------------------------------------------------
;Forward Dash
[State -1, Run!!]
type = ChangeState
value = 100
triggerall = stateno!=105
triggerall = stateno!=100
triggerall = command = "FF" || (command = "dash"&&teammode!=tag) || (command = "dash"&&teammode=tag && partner,stateno=5150)
triggerall = command != "holdback"
trigger1 = statetype != A
trigger1 = ctrl
;Backdash
[State -1, Backdash]
type = ChangeState
value = 105
triggerall = command = "BB" || (command = "dash"&&teammode!=tag) || (command = "dash"&&teammode=tag && partner,stateno=5150)
triggerall = command = "holdback"
trigger1 = statetype != A
trigger1 = ctrl
triggerall = stateno!=105

;===========================================================================
;Taunt
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = GameMode != "Training"
triggerall = command = "start"
trigger1 = statetype != A
trigger1 = ctrl


;Overhead
[State -1, Stand Strong Punch]
type = ChangeState
value =  750
triggerall=stateno!=100
triggerall=stateno!=40
trigger1 = statetype != A
triggerall = command = "y"
triggerall = command = "holdfwd"
triggerall = command !="holddown"
triggerall = command !="holdup"
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact ;&& enemynear, movetype = H
trigger3 = (stateno = 210) && movecontact ;&& enemynear, movetype = H
trigger4 = stateno = 230 && movecontact ;&& enemynear, movetype = H
trigger5 = (stateno = 400) && movecontact ;&& enemynear, movetype = H
trigger6 = stateno = 410 && movecontact ;&& enemynear, movetype = H
trigger7 = stateno = 211 && movecontact ;&& enemynear, movetype = H

;---------------------------------------------------------------------------
;Stand Light Punch
[State -1, Stand Light Punch]
type = ChangeState
value = 200
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
trigger1 = command = "x"
trigger3 = command = "x"
trigger4 = command = "x"
triggerall = command != "holddown" && var(59) !=4
;triggerall = stateno !=40
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = command = "x"
trigger2 = movecontact ;&& enemynear, movetype = H
trigger2 = (stateno = 200)
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = (stateno = 1203) && time > 5
trigger4 = stateno = 100 && time > 11 ;&& command = "bufferedx"  ;|| stateno = 40
 trigger5 = stateno = 400 && movecontact && prevstateno!=200
trigger5 = command = "x"
;---------------------------------------------------------------------------
;Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
value = 210
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "y"
triggerall = command = "holdback"
;triggerall = stateno !=40
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact ;&& enemynear, movetype = H
trigger3 = (stateno = 205) && movecontact ;&& enemynear, movetype = H
trigger4 = (stateno = 1203) && time > 5
trigger5 = stateno = 100 && time > 11 || stateno = 110 && time > 11  ;|| stateno = 40
trigger6 = stateno = 400 && movecontact ;&& enemynear, movetype = H


;---------------------------------------------------------------------------
;Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
value = 211
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact ;&& enemynear, movetype = H
trigger3 = (stateno = 210) && movecontact ;&& enemynear, movetype = H
trigger4 = (stateno = 1203) && time > 5
trigger5 = stateno = 100 && time > 11 || stateno = 110 && time > 11  ;|| stateno = 40
trigger6 = (stateno = 410) && movecontact && prevstateno!=211
trigger7 = (stateno = 400) && movecontact && prevstateno!=211

[State -1, Stand Strong Punch]
type = ChangeState
value = 220
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "z"
triggerall = command != "holddown"
;triggerall = stateno !=40
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact ;&& enemynear, movetype = H
trigger3 = (stateno = 210) && movecontact ;&& enemynear, movetype = H
trigger4 = (stateno = 211) && movecontact ;&& enemynear, movetype = H
trigger5 = (stateno = 1203) && time > 5
trigger6 = stateno = 100 && time > 11 || stateno = 110 && time > 11  ;|| stateno = 40
trigger7 =(stateno = [400,499])  && movecontact && time > 5 &&stateno!=420
trigger8 = (stateno = 420) && movecontact && prevstateno!=220

;---------------------------------------------------------------------------
;---------------------------------------------------------------------------

;---------------------------------------------------------------------------
;Crouching Light Punch
[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "x"
triggerall = command = "holddown"
triggerall = stateno !=40
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact && prevstateno!=400
trigger3 = stateno = 400 && movecontact ;&& enemynear, movetype = H
trigger4 = (stateno = 1203) && time > 5
trigger5 = stateno = 100 && time > 11 || stateno = 110 && time > 11  ;|| stateno = 40

;---------------------------------------------------------------------------
;Crouching Strong Punch
[State -1, Crouching Strong Punch]
type = ChangeState
value = 410
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "y"
triggerall = command = "holddown"
;triggerall = stateno !=40
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 200)|| (stateno = 210)
trigger2 = (movecontact) ;&& enemynear, movetype = H
trigger3 = (stateno = 1203) && time > 5
trigger4 = stateno = 100 && time > 11 || stateno = 110 && time > 11 ;|| stateno = 40
trigger5 = (stateno = 211) && movecontact && prevstateno!=410

;---------------------------------------------------------------------------
;Crouching Light Kick
[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = command = "holdfwd"
;triggerall = stateno !=40
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 200)|| (stateno = 210)||(stateno = 211)|| (stateno = 410)
trigger2 = (movecontact) ;&& enemynear, movetype = H
trigger3 = (stateno = 1203) && time > 5
trigger4 = stateno = 100 && time > 11 || stateno = 110 && time > 11  ;|| stateno = 40
trigger5 = (stateno = 420) && movecontact && prevstateno!=220

;---------------------------------------------------------------------------
;Crouching Light Kick
[State -1, Crouching Light Kick]
type = ChangeState
value = 420
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "z"
triggerall = command = "holddown"
;triggerall = stateno !=40
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 200)|| (stateno = 210)||(stateno = 211)|| (stateno = 410)
trigger2 = (movecontact) ;&& enemynear, movetype = H
trigger3 = (stateno = 1203) && time > 5
trigger4 = stateno = 100 && time > 11  || stateno = 110 && time > 11 ;|| stateno = 40
trigger5 = (stateno = 220) && movecontact && prevstateno!=420&& prevstateno!=430



;---------------------------------------------------------------------------
;Jump Light Punch
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "x"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = movehit && stateno = 600 ;&& enemynear, movetype = H
trigger3 = stateno = 1350 ;Air blocking
trigger4 = stateno = 620 && movehit
trigger5 = stateno = 610 && movehit

;---------------------------------------------------------------------------
;Jump Strong Punch
[State -1, Jump Strong Punch]
type = ChangeState
value = 610
triggerall = stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "buffer_y"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 601  ;jump_x or jump_a
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1350 ;Air blocking
;trigger4 = stateno = 904 && time > 2
trigger4 = stateno = 620 && movehit


;---------------------------------------------------------------------------
;Jump Light Kick
[State -1, Jump Light Kick]
type = ChangeState
value = 630
triggerall = stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "buffer_z"
triggerall = command = "holddown"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 1350 ;Air blocking
trigger3 = stateno = 600 || stateno = 610|| stateno = 620 
trigger3 = movecontact ;&& enemynear, movetype = H
;---------------------------------------------------------------------------
;Jump Light Kick
[State -1, Jump Light Kick]
type = ChangeState
value = 620
triggerall = stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "buffer_z"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 1350 ;Air blocking
trigger3 = stateno = 600 || stateno = 610 
trigger3 = movecontact ;&& enemynear, movetype = H

;---------------------------------------------------------------------------
[State 100, Forward Dash Cancel]
type = ChangeState
value = 100
triggerall = command = "FF" || (command = "dash"&&teammode!=tag) || (command = "dash"&&teammode=tag && partner,stateno=5150)
triggerall = command != "holdback"
triggerall = movehit
triggerall = statetype != A
triggerall = map(dc)=0
trigger1 = stateno = [1001,1002] || stateno = [1101,1102] || stateno = 1500 || stateno = 1300
[State 100, Back Dash Cancel]
type = ChangeState
value = 105
triggerall = command = "BB" || (command = "dash"&&teammode!=tag) || (command = "dash"&&teammode=tag && partner,stateno=5150)
triggerall = command = "holdback"
triggerall = movehit
triggerall = statetype != A
triggerall = map(dc)=0
trigger1 = stateno = [1001,1002] || stateno = [1101,1102] || stateno = 1500 || stateno = 1300
[State 100, Forward Dash Cancel]
type = ChangeState
value = 904
triggerall = command = "aFF" || (command = "dash"&&teammode!=tag) || (command = "dash"&&teammode=tag && partner,stateno=5150)
triggerall = command != "holdback"
triggerall = movehit
triggerall = statetype = A
triggerall = map(dc)=0
triggerall = map(g2s)=0
trigger1 = stateno = 1305 || stateno = 1301 || stateno = 1304
[State 100, Forward Dash Cancel]
type = ChangeState
value = 903
triggerall = command = "aBB" || (command = "dash"&&teammode!=tag) || (command = "dash"&&teammode=tag && partner,stateno=5150)
triggerall = command = "holdback"
triggerall = movehit
triggerall = statetype = A
triggerall = map(dc)=0
triggerall = map(g2s)=0
trigger1 = stateno = 1305 || stateno = 1301 || stateno = 1304


[State 100, Forward Dash Cancel]
type = ChangeState
value = 100
triggerall = command = "FF" || (command = "dash"&&teammode!=tag) || (command = "dash"&&teammode=tag && partner,stateno=5150)
triggerall = command != "holdback"
triggerall = movehit
triggerall = statetype != A
triggerall = map(ndc)=0
trigger1 = hitdefattr = SCA,NA
[State 100, Back Dash Cancel]
type = ChangeState
value = 105
triggerall = command = "BB" || (command = "dash"&&teammode!=tag) || (command = "dash"&&teammode=tag && partner,stateno=5150)
triggerall = command = "holdback"
triggerall = movehit
triggerall = statetype != A
triggerall = map(ndc)=0
trigger1 = hitdefattr = SCA,NA

[State 100, Forward Dash Cancel]
type = ChangeState
value = 904
triggerall = command = "aFF" || (command = "dash"&&teammode!=tag) || (command = "dash"&&teammode=tag && partner,stateno=5150)
triggerall = command != "holdback"
triggerall = movehit
triggerall = statetype = A
triggerall = map(ndc)=0
trigger1 = hitdefattr = SCA,NA
[State 100, Forward Dash Cancel]
type = ChangeState
value = 903
triggerall = command = "aBB" || (command = "dash"&&teammode!=tag) || (command = "dash"&&teammode=tag && partner,stateno=5150)
triggerall = command = "holdback"
triggerall = movehit
triggerall = statetype = A
triggerall = map(ndc)=0
trigger1 = hitdefattr = SCA,NA


;[State -1, Standing Parry]
;type = HitOverRide
;trigger1 = roundstate = 2 && (statetype != A || stateno = 5120)
;trigger1 = command = "fwd" && command != "back" && command != "up" && command != "down"
;trigger1 = ctrl || (stateno = [700, 701]) || stateno = 5120
;attr = SA, AA, AP, HP, HA, NA, SA, SP, NP
;stateno = 700
;slot = 0
;time = 8

;[State -1, Crouching Parry]
;type = hitoverride
;trigger1 = roundstate = 2 && statetype != A
;trigger1 = command = "down" && command != "fwd" && command != "back" && command != "up"
;trigger1 = ctrl || (stateno = [700, 701]) || stateno = 5120
;attr = C, AA, AP, HP, HA, NA, SA
;stateno = 701
;slot = 0
;time = 8

;[State -1, Air Parry]
;type = hitoverride
;trigger1 = roundstate = 2 && statetype = A
;trigger1 = command = "fwd" && command != "back" && command != "up" && command != "down"
;trigger1 = ctrl || stateno = 702
;attr = SA, AA, AP, HP, HA, NA, SA
;stateno = 702
;forceair = 1
;slot = 0
;time = 7

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
trigger1 = ctrl
trigger2 = hitdefattr = SCA ,NA&&movecontact
var(1) = 1

;---------------------------------------------------------------------------
;LETS FINISH HIM OFF- HYAAAH
[State -1, Triple Kung Fu Palm]
type = ChangeState
value = 3000
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "TripleKFPalm"
triggerall = power >= 2000
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = statetype = A
trigger2 = hitdefattr = A, NA, SA
trigger2 = stateno != [3000,3050)
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 1030 && movecontact ;&& enemynear, movetype = H
trigger5 = stateno = 1033 && movecontact ;&& enemynear, movetype = H
;---------------------------------------------------------------------------
;THE FUN DOESN'T STOP- INFERNO
[State -1, Triple Kung Fu Palm]
type = ChangeState
value = 3010
triggerall = !numhelper(3011)
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "TripleKFPalm"
triggerall = power >= 2000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA
trigger2 = stateno != [3000,3050)
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
;===========================================================================

[State -1, Grab]
type = ChangeState
value = 800
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
trigger1 = command = "throwtech"
trigger1 = statetype != A
trigger1 = ctrl

[State -1,DJC]
type = ChangeState
value = 45
triggerall = command = "holdupb"
triggerall = statetype = A
triggerall = stateno!=45 && stateno!=46 && stateno!= 4260 && (stateno!=[4000,4099])
triggerall = var(45)>0
;triggerall = var(29)>0
trigger1 = stateno != 504 && stateno !=1655 && stateno !=1656 && stateno !=1657 && ctrl && stateno!=45 && stateno!=46 && stateno!=50 && stateno!=40 && stateno!= 4260
trigger2 = stateno != 504 && stateno !=1655 && stateno !=1656 && stateno !=1657 && movecontact ;&& enemynear, movetype = H
trigger2 = stateno != 504 && stateno !=1655 && stateno !=1656 && stateno !=1657 && hitdefattr = A, NA
trigger3 = stateno != 504 && stateno !=1655 && stateno !=1656 && stateno !=1657 && stateno=45 || stateno=46|| stateno=50
trigger3 = stateno != 504 && stateno !=1655 && stateno !=1656 && stateno !=1657 && vel y>.1

[State -1, EX j6S]
type = ChangeState
value = 1035
triggerall = roundstate = 2 ;only attack during the round
triggerall = !numexplod(924685) ;this is the new ex limiter
triggerall = power>1000
triggerall = statetype = A
triggerall = command = "holdfwd"
triggerall = command = "b"
triggerall = command = "c"
trigger1 = ctrl
trigger2 = var(1)
trigger3 = (stateno = [600,640]) 
trigger3 = movecontact ;&& enemynear, movetype = H
trigger4 = stateno = 904

[State -1, j6S]
type = ChangeState
value = 1030
triggerall = roundstate = 2 ;only attack during the round
triggerall = statetype = A
triggerall = command = "holdfwd"
triggerall = command = "b"
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 904
trigger4 = (stateno = [600,640]) 
trigger4 = movecontact ;&& enemynear, movetype = H

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

[State -1, EX 2S]
type = ChangeState
value = 1005
triggerall = roundstate = 2 ;only attack during the round
triggerall = !numexplod(924683) ;this is the new ex limiter
triggerall = power>1000
triggerall = command = "b"
triggerall = command = "c"
triggerall = command = "holddown"
triggerall = command != "holdback"
triggerall = stateno != 1020
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)

[State -1, 2S]
type = ChangeState
value = 1000
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "b"
triggerall = command = "holddown"
triggerall = command != "holdback"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)

;--------------------------------------------------------------------------
[State -1, EX 6S]
type = ChangeState
value = 1025
triggerall = roundstate = 2 ;only attack during the round
triggerall = !numexplod(924681) ;this is the new ex limiter
triggerall = power>1000
triggerall = command = "b"
triggerall = command = "c"
triggerall = command = "holdfwd"
triggerall = fvar(22) = 0
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)

[State -1, 6S]
type = ChangeState
value = 1020
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "b"
triggerall = command = "holdfwd"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)

;stomperino
[State -1, EX 4S]
type = ChangeState
value = 1206
triggerall = roundstate = 2 ;only attack during the round
triggerall = !numexplod(924682) ;this is the new ex limiter
triggerall = power>1000
triggerall = command = "b" && command="holdback" && command = "c"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)

[State -1, 4S]
type = ChangeState
value = 1205
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "b" && command="holdback"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)

[State -1, EX 5S]
type = ChangeState
value = 1016
triggerall = roundstate = 2 ;only attack during the round
triggerall = !numexplod(924680) ;this is the new ex limiter
triggerall = power>1000
triggerall = fvar(21) = 0
triggerall = command = "b"
triggerall = command = "c"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)

[State -1, 5S]
type = ChangeState
value = 1010
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "b"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = [200,499] && movecontact
trigger3 = stateno = [502,503] && movecontact
trigger4 = stateno = 656 && movehit


[State -1, EX jS]
type = ChangeState
value = 1656
triggerall = roundstate = 2 ;only attack during the round
triggerall = !numexplod(924684) ;this is the new ex limiter
triggerall = power>1000
triggerall = command = "c"
triggerall = command = "b"
triggerall = command != "holdfwd"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = (stateno = [600,640]) 
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1350 ;Air blocking

[State -1, jS]
type = ChangeState
value = 1657
triggerall = roundstate = 2 ;only attack during the round
triggerall = command != "holdfwd"
;triggerall = command = "holddown"
triggerall = command = "b"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = (stateno = [600,640]) 
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1350 ;Air blocking


;[State -1, Viper Flare]
;type = ChangeState
;value = 1655
;triggerall = command = "b"
;triggerall = command != "holdfwd"
;triggerall = statetype = A
;trigger1 = ctrl
;trigger2 = (stateno = [600,640]) 
;trigger2 = movecontact
;trigger3 = stateno = 1350 ;Air blocking

[State -1, Air grab BOYEEE]
type = ChangeState
value = 550
triggerall=map(awing)
triggerall = roundstate = 2 ;only attack during the round
;triggerall = command != "holdfwd"
;triggerall = command = "holddown"
triggerall = pos y<-30
triggerall = prevstateno != 850
triggerall = command = "c"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = (stateno = [600,640]) 
trigger2 = movecontact ;&& enemynear, movetype = H 
trigger3 = stateno = 1350 ;Air blocking
;--------------------------------------------------------------------------
;Forward Dash
[State -1, Run!!]
type = ChangeState
value = 100
triggerall = stateno!=105
triggerall = stateno!=100
triggerall = stateno!=101
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
;---------------------------------------------------------------------------
;Taunt
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = GameMode != "Training"
triggerall = command="start"
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
trigger4 = (stateno = 400) && movecontact ;&& enemynear, movetype = H
trigger5 = stateno = 410 && movecontact ;&& enemynear, movetype = H
trigger6 = stateno = 101 

;Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
value = 200
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 400 && movecontact&&prevstateno!=200
trigger3 = stateno = 200 && movecontact
trigger4 = stateno = 101 
 
;Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
value =  210
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact ;&& enemynear, movetype = H
;trigger3 = stateno = 100 && time > 3
trigger3 = stateno = 400 && movecontact ;&& enemynear, movetype = H
trigger4 = stateno = 410 && movecontact&&prevstateno!=210

;6H
[State -1, Stand Strong Punch]
type = ChangeState
value =  230
triggerall = roundstate = 2 ;only attack during the round
trigger1 = statetype != A
triggerall = command = "z"
triggerall = command = "holdfwd"
triggerall = command !="holddown"
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact ;&& enemynear, movetype = H
trigger3 = (stateno = 210) && movecontact ;&& enemynear, movetype = H
trigger4 = (stateno = 220) && movecontact ;&& enemynear, movetype = H
trigger5 = (stateno = 410) && movecontact ;&& enemynear, movetype = H
trigger6 = (stateno = 420) && movecontact ;&& enemynear, movetype = H
trigger7 = stateno = 101 
trigger8 = stateno = 400 && movecontact ;&& enemynear, movetype = H

;Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
value =  220
triggerall = roundstate = 2 ;only attack during the round
trigger1 = statetype != A
triggerall = command = "z"
triggerall = command != "holddown"
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact ;&& enemynear, movetype = H
trigger3 = (stateno = 210) && movecontact ;&& enemynear, movetype = H
trigger4 = (stateno = 410) && movecontact ;&& enemynear, movetype = H
trigger5 = stateno = 420 && movecontact&&prevstateno!=220
;trigger6 = stateno = 100 && time > 3
trigger6 = stateno = 400 && movecontact ;&& enemynear, movetype = H

;---------------------------------------------------------------------------
;Crouching Light Punch
[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact&&prevstateno!=400
trigger3 = stateno = 400 && movecontact ;&& enemynear, movetype = H

;---------------------------------------------------------------------------
;Crouching Strong Punch
[State -1, Crouching Strong Punch]
type = ChangeState
value = 410
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 200) 
trigger2 = (movecontact) ;&& enemynear, movetype = H
trigger3 = stateno = 210 && movecontact&&prevstateno!=410


;---------------------------------------------------------------------------
;Crouching Strong Kick
[State -1, Crouching Strong Kick]
type = ChangeState
value = 430
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = command = "holdfwd"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 410) || (stateno = 210)  || (stateno = 200) || (stateno = 220)|| (stateno = 420)
trigger2 = (movecontact) ;&& enemynear, movetype = H
trigger3 = stateno = 101

;---------------------------------------------------------------------------
;Crouching Light Kick
[State -1, Crouching Light Kick]
type = ChangeState
value = 420
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = command != "holdfwd"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 410)|| (stateno = 200)|| (stateno = 210)
trigger2 = (movecontact) ;&& enemynear, movetype = H
trigger3 = stateno = 220 && movecontact&&prevstateno!=420


;========================================================
[State R Phoenix Stance]
type = ChangeState
value = 500
triggerall=map(gwing)
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "c" 
triggerall = command!="b"&&command!="EX"
triggerall = statetype != A
trigger1 = var(1)
;---------------------------------------------------------------------------

;Jump Light Punch
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "x"
triggerall = statetype = A
trigger1 = ctrl
trigger2= stateno = 610 && movehit
trigger3= stateno = 630 && movehit
trigger4= stateno = 600 && movehit
;---------------------------------------------------------------------------
;Jump Strong Punch
[State -1, Jump Strong Punch]
type = ChangeState
value = 610
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "y"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 601  ;jump_x or jump_a
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1350 ;Air blocking
trigger4 = stateno = 630 && movehit

;---------------------------------------------------------------------------
;Jump Strong Kick
[State -1, Jump Strong Kick]
type = ChangeState
value = 630
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "z"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = (stateno = [600,610]) 
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1350 ;Air blocking
;---------------------------------------------------------------------------

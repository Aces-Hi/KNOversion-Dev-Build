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
triggerall = stateno != [642,643]
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,299]) || (stateno = [400,499]) || (stateno = 401)
trigger2 = movecontact ;&& enemynear, movetype = H
trigger2 = stateno!=421 && stateno!= 453
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 105 && time > 16
trigger5 = stateno = 434
var(1) = 1


;---------------------------------------------------------------------------
[State 3013, j236X: Air Super Dash Slash]
type = ChangeState
value = 3013
triggerall = stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "TripleKFPalm"
triggerall = power >= 2000
triggerall=stateno!=750
triggerall=stateno!=755
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = statetype = A
trigger2 = hitdefattr = A, NA, SA
trigger2 = stateno != [3000,3050)
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 1053 && movecontact ;&& enemynear, movetype = H
triggerall = var(50)=0
;---------------------------------------------------------------------------
[State 3010, 236X: Super Dash Slash]
type = ChangeState
value = 3010
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "TripleKFPalm"
triggerall = power >= 2000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3000,3050)
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 1053 && movecontact ;&& enemynear, movetype = H
triggerall = var(50)=0
;---------------------------------------------------------------------------
[State 3010, 236X: Ono Super Dash Slash]
type = ChangeState
value = 3016
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "TripleKFPalm"
triggerall = power >= 2000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3000,3050)
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 1053 && movecontact ;&& enemynear, movetype = H
triggerall = var(50)!=0
;---------------------------------------------------------------------------
[State 3013, j236X: Ono Air Super Dash Slash]
type = ChangeState
value = 3017
triggerall = stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "TripleKFPalm"
triggerall = power >= 2000
triggerall=stateno!=750
triggerall=stateno!=755
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = statetype = A
trigger2 = hitdefattr = A, NA, SA
trigger2 = stateno != [3000,3050)
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 1053 && movecontact ;&& enemynear, movetype = H
triggerall = var(50)!=0
;---------------------------------------------------------------------------
[State 3050, 214X: Timestop]
type = ChangeState
value = 3050
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "SmashKFUpper"
triggerall = power >= 4000
triggerall = !var(50)
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3000,3050)
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 1053 && movecontact ;&& enemynear, movetype = H
;===========================================================================
[State 800, Grab]
type = ChangeState
value = 800
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
trigger1 = command ="throwtech"
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------

[State 45, DJC]
type = ChangeState
value = 45
triggerall = statetype=A
triggerall = command = "holdupb"
triggerall = numexplod(2045)
triggerall = stateno!=45 && stateno!=46 && stateno!= 434 && (stateno!=[4000,4099])
triggerall = var(45)>0
;triggerall = var(29)>0
trigger1 = stateno!= 1055 && stateno !=1052 && ctrl && stateno!=45 && stateno!=46 && stateno!=50 && stateno!=40 && stateno!= 434
trigger2 = stateno!= 1055 && stateno !=1052 && movecontact  && enemynear, movetype = H
trigger2 = stateno!= 1055 && stateno !=1052 && hitdefattr = A, NA
trigger3 = stateno!= 1055 && stateno !=1052 && stateno=45 || stateno=46|| stateno=50 
trigger4 = stateno= 1055 &&movehit



[State 1034, 2EX: EX Shoryu]
type = ChangeState
value = 1034
triggerall=stateno!=40
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = !numexplod(99752) ;this is the new ex limiter
triggerall = power>=1000
triggerall = !var(50)
triggerall = command = "EX"
triggerall = command = "holddown"
triggerall = command != "holdfwd"
triggerall = command != "holdback"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=105
trigger4 = (stateno = [600,650]) && movecontact

[State 1030, 2S: Shoryu]
type = ChangeState
value = 1030
triggerall=stateno!=40
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = !var(50)
triggerall = command = "b"
triggerall = command != "c"
triggerall = command = "holddown"
triggerall = command != "holdfwd"
triggerall = command != "holdback"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=105
trigger4 = (stateno = [600,650]) && movecontact



[State 10301, j2EX: Air EX Shoryu]
type = ChangeState
value = 10301
triggerall = stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = !numexplod(99752) ;this is the new ex limiter
triggerall = power>=1000
triggerall = !var(50)
triggerall = command = "EX"
triggerall = command = "holddown"
triggerall = command != "holdfwd"
triggerall = command != "holdback"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = (stateno = [600,650]) && movecontact

[State 10300, j2S: Air Shoryu]
type = ChangeState
value = 10300
triggerall = stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = !var(50)
triggerall = command = "b"
triggerall = command != "c"
triggerall = command = "holddown"
triggerall = command != "holdfwd"
triggerall = command != "holdback"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = (stateno = [600,650]) && movecontact

[State 1027, j4EX: EX Shredder]
type = ChangeState
value = 1027
triggerall = stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = !numexplod(99751) ;this is the new ex limiter
triggerall = power>=1000 
triggerall = command = "EX"
triggerall = command = "holdback"
triggerall = !var(50)
triggerall = statetype = A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = (stateno = [600,650]) && movecontact


[State 1020, j4S: Shredder]
type = ChangeState
value = 1020
triggerall = stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "b"
triggerall = command != "c"
triggerall = command = "holdback"
triggerall = statetype = A
triggerall = !var(50)
trigger1 = var(1)
trigger2 = ctrl
trigger3 = (stateno = [600,650]) && movecontact


[State 1240, 6EX: EX Dash Slash]
type = ChangeState
value = 1240
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = !numexplod(99753) ;this is the new ex limiter
triggerall = power>=1000
triggerall = !var(50)
triggerall = command = "EX"
triggerall = command = "holdfwd"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=105
trigger4 = stateno = 643&&movecontact

[State 1240, j6EX: EX Dash Slash]
type = ChangeState
value = 1245
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = !numexplod(99753) ;this is the new ex limiter
triggerall = power>=1000
triggerall = !var(50)
triggerall = command = "EX"
triggerall = command = "holdfwd"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = (stateno = [600,650]) && movecontact

[State 1040, 6S: Dash Slash]
type = ChangeState
value = 1040
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = !var(50)
triggerall = command = "b"
triggerall = command != "c"
triggerall = command = "holdfwd"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=105
trigger4 = (stateno = [600,650]) && movecontact

[State 1040, j6S: Dash Slash]
type = ChangeState
value = 1045
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = !var(50)
triggerall = command = "b"
triggerall = command != "c"
triggerall = command = "holdfwd"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = (stateno = [600,650]) && movecontact


[State 10400, ono6S: Ono Run]
type = ChangeState
value = 10400
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = var(50)
triggerall = command = "b"
triggerall = command != "c"
triggerall = command = "holdfwd"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=105

[State 1010, 4EX: EX Slashes]
type = ChangeState
value = 1010
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = !numexplod(99750) ;this is the new ex limiter
triggerall = power>=1000
triggerall = !var(50)
triggerall = command = "EX"
triggerall = command = "holdback"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=105
trigger4 = (stateno = [600,650]) && movecontact

[State 100, 4S: Slashes]
type = ChangeState
value = 1000
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = !var(50)
triggerall = command = "b"
triggerall = command != "c"
triggerall = command = "holdback"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 101
trigger4 = stateno = 100
trigger5=stateno=105
trigger6 = (stateno = [600,650]) && movecontact

[State 12251, jEX: EX Air Flip]
type = ChangeState
value = 12251
triggerall = stateno!=40
triggerall =! var(50)
triggerall = roundstate = 2 ;only attack during the round
triggerall = !numexplod(99754) ;this is the new ex limiter
triggerall = power>=1000
trigger1 = statetype = A
triggerall = command = "EX"
triggerall = command != "holdfwd"
triggerall = command != "holddown"
triggerall = command != "holdback"
trigger1 = ctrl
trigger2 = (stateno = [600,650]) && movecontact


[State 1151, jS: Air Flip]
type = ChangeState
value = 1151
triggerall = stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = statetype = A
triggerall = command = "b"
triggerall = command != "c"
triggerall = command != "holdfwd"
triggerall = command != "holddown"
triggerall = command != "holdback"
trigger1 = ctrl
trigger2 = (stateno = [600,650]) && movecontact


[State 1250, 5EX: EX Flip]
type = ChangeState
value = 1250
triggerall=stateno!=40
triggerall =! var(50)
triggerall = roundstate = 2 ;only attack during the round
triggerall = !numexplod(99754) ;this is the new ex limiter
triggerall = power>=1000
triggerall = command = "EX"
triggerall = command != "holdfwd"
triggerall = command != "holddown"
triggerall = command != "holdback"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=105
trigger4 = (stateno = [600,650]) && movecontact

[State 1050, 5S: Flip]
type = ChangeState
value = 1050
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "b"
triggerall = command != "c"
triggerall = command != "holdfwd"
triggerall = command != "holddown"
triggerall = command != "holdback"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 101
trigger4 = (stateno = [600,650]) && movecontact
trigger5=stateno=105

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
trigger2 = (stateno = [600,640]) 
trigger2 = movehit
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
trigger2 = (stateno = [600,640]) 
trigger2 = movehit

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
trigger2 = stateno = 111250 && time>17
trigger3 = stateno = 111251 && time>17
;Backdash
[State -1, Backdash]
type = ChangeState
value = 105
triggerall = command = "BB" || (command = "dash"&&teammode!=tag) || (command = "dash"&&teammode=tag && partner,stateno=5150)
triggerall = command = "holdback"
trigger1 = statetype != A
trigger1 = ctrl
triggerall = stateno!=105
trigger2 = stateno = 111250 && time>17
trigger3 = stateno = 111251 && time>17

;---------------------------------------------------------------------------
[State 755, Ono6M: Ono Overhead]
type = ChangeState
value =  755
trigger1 = statetype != A
triggerall = var(50)!=0
triggerall = command = "y"
triggerall = command = "holdfwd"
triggerall = command !="holddown"
trigger1 = ctrl
trigger2 = (stateno = 205) && movecontact 
trigger3 = (stateno = 215) && movecontact 
trigger4 = (stateno = 400) && movecontact 
trigger5 = stateno = 415 && movecontact
trigger6 = stateno = 425 && movecontact



[State 750, 6M: Overhead]
type = ChangeState
value =  750
triggerall=stateno!=100
triggerall=stateno!=40
trigger1 = statetype != A
triggerall = var(50)=0
triggerall = command = "y"
triggerall = command = "holdfwd"
triggerall = command !="holddown"
triggerall = command !="holdup"
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact 
trigger3 = (stateno = 210) && movecontact 
trigger4 = stateno = 230 && movecontact
trigger5 = (stateno = 400) && movecontact 
trigger6 = stateno = 410 && movecontact
trigger7 = stateno = 420 && movecontact
trigger8 = stateno = 211 && movecontact
trigger9 = stateno = 401 && movecontact
;===========================================================================
;---------------------------------------------------------------------------

[State 200, 5L: Light Attack]
type = ChangeState
value = 200
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "x"
triggerall = var(50)=0
triggerall = command != "holddown"
triggerall = statetype != A 
trigger1 = ctrl
trigger2 = (stateno = 200)|| (stateno = 401)
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 205 || stateno = 215 || stateno = 225 || stateno = 410 || stateno = 425 || stateno = 435
trigger3 = movecontact
trigger4 = stateno = 101
trigger5 = stateno = 400  &&movecontact && prevstateno!=200

[State 205, ono5L: Ono Light Attack]
type = ChangeState
value = 205
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "x"
triggerall = var(50)!=0
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 101
trigger3 = stateno = 400  &&movecontact && prevstateno!=205

[State 210, 4M: Back Medium Attack]
type = ChangeState
value =  210
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
;triggerall = anim = 210
triggerall = command = "y"
triggerall = command = "holdback"
triggerall = var(50)=0
;triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact ;&& enemynear, movetype = H
trigger3 = (stateno = 400) && movecontact || (stateno = 401)&&movecontact
trigger4 = stateno = 205 || stateno = 215 || stateno = 225 || stateno = 410 || stateno = 425 || stateno = 435
trigger4 = movecontact
trigger5 = stateno = 101

[State 211, 5M: Medium Attack]
type = ChangeState
value =  211
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
;triggerall = anim = 220
triggerall = command = "y"
;triggerall = command != "holddown"
triggerall = var(50)=0
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 420) && movecontact && prevstateno!=211
trigger3 = (stateno = 210) && movecontact ;&& enemynear, movetype = H
trigger4 = (stateno = 200) && movecontact ;&& enemynear, movetype = H
trigger5 = (stateno = 400) && movecontact|| (stateno = 401)&&movecontact
trigger6 = stateno = 205 || stateno = 215 || stateno = 225 || stateno = 410 || stateno = 425 || stateno = 435
trigger6 = movecontact
trigger7 = stateno = 101


[State 220, 5H: Heavy Attack]
type = ChangeState
value =  220
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "z"
triggerall = var(50)=0
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact
trigger3 = (stateno = [210,211]) && movecontact 
trigger4 = (stateno = 400) && movecontact || (stateno = 401)&&movecontact
trigger5 = (stateno = 410) && movecontact 
trigger6 = (stateno = 420) && movecontact 
trigger7 = stateno = 205 || stateno = 215 || stateno = 225 || stateno = 410 || stateno = 425 || stateno = 435
trigger7 = movecontact
trigger8 = stateno = 101
trigger9 = (stateno = 430) && movecontact && prevstateno!=220&& prevstateno!=440

[State 215, ono5M: Ono Standing Medium]
type = ChangeState
value =  215
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = var(50)!=0
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 205 && movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 101
trigger5 = stateno = 400
trigger4 = (stateno = 425) && movecontact && prevstateno!=215


[State 225, ono5H: Ono Standing Heavy]
type = ChangeState
value = 225
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = var(50)!=0
triggerall = command = "z"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,215]) && movecontact ;&& enemynear, movetype = H
trigger3 = (stateno = [400,425]) && movecontact || (stateno = 401) && movecontact
trigger4 = stateno = 101
trigger5 = (stateno = 440) && movecontact ;&& enemynear, movetype = H
trigger6 = (stateno = 435) && movecontact && prevstateno!=225

[State 440, 3H: Trip]
type = ChangeState
value = 440
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = command = "holdfwd"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 425)|| (stateno = 215)||(stateno = 200)||(stateno = 210)||(stateno = 211)||(stateno = 420)|| (stateno = 401)
trigger2 = (movecontact) ;&& enemynear, movetype = H
trigger3 = (stateno = 220) && movecontact && prevstateno!=430

;---------------------------------------------------------------------------
[State 450, 2R: Upwards Sword Toss]
type = ChangeState
value = 450
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = !var(50)
triggerall = command = "c"
triggerall = command != "b"
triggerall = command = "holddown"
triggerall = statetype != A 
trigger1 = ctrl
trigger2 = (stateno =[200,249])|| (stateno =[400,449])|| (stateno = 401)
trigger2 = (movecontact) ;&& enemynear, movetype = H

;---------------------------------------------------------------------------
[State 400, 2L: Crouching Light Attack]
type = ChangeState
value = 400
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "x"
triggerall = command = "holddown"
triggerall = statetype != A 
trigger1 = ctrl
trigger2 = stateno = 215 || stateno = 225 || stateno = 410 || stateno = 425 || stateno = 435
trigger2 = movecontact
trigger3 = stateno = 205  || stateno = 200
trigger3 = movecontact && prevstateno!=400


;---------------------------------------------------------------------------
[State 420, 2M: Crouching Medium Attack]
type = ChangeState
value = 420
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = var(50)=0
triggerall = command = "y"
triggerall = command = "holddown"
triggerall = statetype != A 
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 410)|| (stateno = 200)|| (stateno = 210)|| (stateno = 401)
trigger2 = (movecontact) ;&& enemynear, movetype = H
trigger3 = stateno = 205 || stateno = 215 || stateno = 225 || stateno = 410 || stateno = 425 || stateno = 435
trigger3 = movecontact
trigger4 = (stateno = 211) && movecontact && prevstateno!=420

;---------------------------------------------------------------------------
[State 430, 2H: Crouching Heavy Attack]
type = ChangeState
value = 430
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = var(50)=0
triggerall = stateno !=430
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 410)|| (stateno = 420)|| (stateno = 440)|| (stateno = 401)
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = (stateno =[200,250])|| (stateno =[400,449])|| (stateno = 401)
trigger3 = movecontact&&stateno!=220
trigger4 = stateno = 205 || stateno = 215 || stateno = 225 || stateno = 410 || stateno = 425 || stateno = 435
trigger4 = movecontact
trigger5 = (stateno = 220) && movecontact && prevstateno!=430

;---------------------------------------------------------------------------
;Ono 2M
[State 425, ono2M: Ono Crouching Medium Attack]
type = ChangeState
value = 425
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = var(50)!=0
triggerall = command = "y"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 410)|| (stateno = 200)|| (stateno = 205)|| (stateno = 210) || (stateno = 401)
trigger2 = (movecontact) ;&& enemynear, movetype = H
trigger3 = (stateno = 215) && movecontact && prevstateno!=425
;---------------------------------------------------------------------------
[State 435, ono2H: Ono Crouching Heavy Attack]
type = ChangeState
value = 435
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = var(50)!=0
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = statetype != A 
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 410)|| (stateno = 425)|| (stateno = 440)|| (stateno = 401)
trigger2 = (movecontact) ;&& enemynear, movetype = H
trigger3 = (stateno = 210) && movecontact  ;&& enemynear, movetype = H
trigger4 = (stateno = 205) && movecontact  ;&& enemynear, movetype = H
trigger5 = (stateno = 215) && movecontact ;&& enemynear, movetype = H
trigger6 = (stateno = 230) && movecontact  ;&& enemynear, movetype = H
trigger7 = (stateno = 240) && movecontact  ;&& enemynear, movetype = H
trigger8 = (stateno = 250) && movecontact  ;&& enemynear, movetype = H
trigger9 = (stateno = 221) && movecontact ;&& enemynear, movetype = H
trigger10 = (stateno = 225) && movecontact && prevstateno!=435
trigger11 = (stateno = 235) && movecontact  ;&& enemynear, movetype = H


[State 250, 5R: Standing Sword Throw]
type = ChangeState
value = 250
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "c" 
triggerall = command != "b"
triggerall = command != "holddown"
triggerall = command != "holdup"
triggerall = !var(50)
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (HitdefAttr = S, NA || HitdefAttr = C, NA) && movecontact

;---------------------------------------------------------------------------
[State 610, jL: Jump Light Attack]
type = ChangeState
value = 610
triggerall = stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "x"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 601  ;jump_x or jump_a
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1350 ;Air blocking
trigger4 = stateno = 620 && movehit
trigger5 = stateno = 630 && movehit
trigger6 = stateno = 625 && movehit
trigger7 = stateno = 635 && movehit

;---------------------------------------------------------------------------
[State 611, jLL]
type = ChangeState
value = 611
triggerall = stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "x"
triggerall = statetype = A
trigger1 = stateno = 610 && movecontact && anim=600
;---------------------------------------------------------------------------
[State 630, jM: Jump Medium Attack]
type = ChangeState
value = 630
triggerall = stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = var(50)=0
triggerall = command = "buffer_y"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 1350 ;Air blocking
trigger3 = stateno = 600 || stateno = 610 || stateno = 611
trigger3 = movecontact ;&& enemynear, movetype = H
trigger4 = stateno = 620 || stateno = 625
trigger4 = movehit

;---------------------------------------------------------------------------
[State 620, jH: Jump Heavy Attack]
type = ChangeState
value = 620
triggerall = stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = var(50)=0
triggerall = command = "buffer_z"
triggerall = command != "holddown"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 600)|| stateno = 630  || stateno = 610  || stateno = 611|| stateno = 635
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1350 ;Air blocking

;---------------------------------------------------------------------------
[State 650, j2H: Jump Down Heavy Attack]
type = ChangeState
value = 650
triggerall = stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = var(50)=0
triggerall = command = "buffer_z"
triggerall = command = "holddown"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 600)|| stateno = 630  || stateno = 650  || stateno = 635
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1350 ;Air blocking

;---------------------------------------------------------------------------
[State 635, onojM: Ono Jump Medium]
type = ChangeState
value = 635
triggerall = stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = var(50)!=0
triggerall = command = "buffer_y"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 1350 ;Air blocking
trigger3 = stateno = 600 || stateno = 610 || stateno = 611
trigger3 = movecontact ;&& enemynear, movetype = H
trigger4 = stateno = 625 || stateno = 620
trigger4 = movehit

;---------------------------------------------------------------------------
[State 625, onojH: Ono Jump Heavy]
type = ChangeState
value = 625
triggerall = stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = var(50)!=0
triggerall = command = "buffer_z"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 635 || stateno = 630 
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1350 ;Air blocking
trigger4 = stateno = 610|| stateno = 611
trigger4 = movecontact ;&& enemynear, movetype = H

;---------------------------------------------------------------------------
[State 645, onojR: Ono Jump Remix Sword Tumble]
type = ChangeState
value = 645
triggerall = stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = var(50)!=0 || stateno = 452
triggerall = command = "buffer_c"
triggerall = command != "b"
triggerall = command != "holdfwd"
triggerall = command != "holddown"
triggerall = Helper(260), stateno = 261 || Helper(260), stateno = 461 || Helper(260), Stateno = 661 || Helper(260), Stateno = 860
triggerall = statetype = A
trigger1 = ctrl
trigger2 = (stateno = [600,635]) 
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1350 ;Air blocking

[State 645, onojR: Ono Jump Remix Sword Landed]
type = ChangeState
value = 645
triggerall = stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = var(50)!=0 || stateno = 452
triggerall = command = "buffer_c"
triggerall = command != "holdfwd"
triggerall = command != "holddown"
triggerall = command != "b"
triggerall = !(Helper(260), stateno = 261 || Helper(260), stateno = 461 || Helper(260), Stateno = 661 || Helper(260), Stateno = 860)
triggerall = statetype = A
trigger1 = ctrl
trigger2 = (stateno = [600,635]) 
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1350 ;Air blocking

;---------------------------------------------------------------------------
[State 640, jR: Jumping Sword Throw]
type = ChangeState
value = 640
triggerall = stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = var(50)=0 && stateno != 452
triggerall = command = "buffer_c"
triggerall = command != "b"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = (stateno = [600,635]) 
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1350 ;Air blocking

;-------------------------------------------------------------------------------
[State 253, Sword Retrieval Method: Bash]
type = ChangeState
triggerall=stateno!=40
triggerall = var(50)!=0
triggerall = statetype != A
triggerall = command = "buffer_c"
triggerall = command != "b"
triggerall = command != "holdfwd"
triggerall = command != "holddown"
trigger1 = time > 15 && stateno = 111250
trigger2 = time > 22 && stateno = 450
trigger3 = time > 40 && stateno = 111251
trigger4 = ctrl 
trigger4 = Helper(260), stateno = 261 || Helper(260), stateno = 461 || Helper(260), Stateno = 661 || Helper(260), Stateno = 860
trigger5=ctrl
value = 253
trigger6 = hitdefattr=SCA,NA
trigger6=movecontact
;-------------------------------------------------------------------------------
[State 251, Sword Retrieval Method: Slash]
type = ChangeState
triggerall=stateno!=40
triggerall = var(50)!=0
triggerall = statetype != A
triggerall = command = "buffer_c"
triggerall = command != "b"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
trigger1 = time > 15 && stateno = 111250
trigger2 = time > 22 && stateno = 450
trigger3 = time > 40 && stateno = 111251
trigger4 = ctrl
trigger4 = Helper(260), stateno = 261 || Helper(260), stateno = 461 || Helper(260), Stateno = 661 || Helper(260), Stateno = 860
trigger5=ctrl
value = 251
trigger6 = hitdefattr=SCA,NA
trigger6=movecontact
;-------------------------------------------------------------------------------
[State 451, Sword Retrieval Method: Hop]
type = ChangeState
triggerall=stateno!=40
triggerall = var(50)!=0
triggerall = statetype != A
triggerall = command = "buffer_c"
triggerall = command != "b"
triggerall = command = "holddown"
trigger1 = time > 15 && stateno = 111250
trigger2 = time > 22 && stateno = 450
trigger3 = time > 40 && stateno = 111251
trigger4 = ctrl
trigger4 = Helper(260), stateno = 261 || Helper(260), stateno = 461 || Helper(260), Stateno = 661 || Helper(260), Stateno = 860
trigger5=ctrl
value = 451
trigger6 = hitdefattr=SCA,NA
trigger6=movecontact
;-------------------------------------------------------------------------------
[State 641, Aerial Sword Retrieval Method: Gnash]
type = ChangeState
triggerall = statetype = A
triggerall = stateno!=40
triggerall = command = "buffer_c"
triggerall = command != "b"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
triggerall=stateno!=641
triggerall=prevstateno!=641
trigger1 = time > 25 && stateno = 640
trigger2 = ctrl
trigger2 = Helper(260), stateno = 261 || Helper(260), stateno = 461 || Helper(260), Stateno = 661 || Helper(260), Stateno = 860
trigger3=ctrl
trigger4 = (stateno = [600,635]) 
trigger4 = movecontact ;&& enemynear, movetype = H
value = 641

;-------------------------------------------------------------------------------
[State 651, Aerial Sword Retrieval Method: Drop]
type = ChangeState
triggerall = statetype = A
triggerall = stateno!=40
triggerall = command = "holddown"
triggerall = command != "b"
triggerall = command = "buffer_c"
trigger1 = time > 25 && stateno = 640
trigger2 = Helper(260), stateno = 261 || Helper(260), stateno = 461 || Helper(260), Stateno = 661 || Helper(260), Stateno = 860
trigger2 = ctrl 
trigger3=ctrl
trigger4 = (stateno = [600,635]) 
trigger4 = movecontact ;&& enemynear, movetype = H
value = 651


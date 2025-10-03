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
trigger2 = (stateno = [200,299]) || (stateno = [400,420]) || (stateno = [500,510])
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 105 && time > 16
var(1) = 1


;===========================================================================
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
trigger4 = (stateno = 400) && movecontact 
trigger5 = stateno = 410 && movecontact
trigger6 = stateno = 211 && movecontact

[State -1, Grab]
type = ChangeState
value = 800
trigger1 = command = "throwtech"
trigger1 = statetype != A
trigger1 = ctrl

[State -1,DJC]
type = ChangeState
value = 45
triggerall = statetype = A 
triggerall = command = "holdupb"
triggerall = stateno!=45 && stateno!=46 && stateno!= 434 && (stateno!=[4000,4099])
triggerall = map(djump)=0
triggerall = map(airdash)=0
trigger1 = ctrl && stateno!=45 && stateno!=46 && stateno!=50 && stateno!=40 && stateno!= 434&& stateno!= 903
trigger2 = movecontact  && enemynear, movetype = H
trigger2 = hitdefattr = A, NA
trigger3 =  stateno=45 || stateno=46|| stateno=50
trigger3 = vel y>.1
trigger4 = stateno= 903&&animelemtime(7)<0
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
triggerall = map(djump)=0
triggerall = map(airdash)=0
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
triggerall = map(djump)=0
triggerall = map(airdash)=0
triggerall = (pos y<-30 && vel y < 0) || (vel y >=0)

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
trigger2 = stateno = 510 && time > 8
;Backdash
[State -1, Backdash]
type = ChangeState
value = 105
triggerall = command = "BB" || (command = "dash"&&teammode!=tag) || (command = "dash"&&teammode=tag && partner,stateno=5150)
triggerall = command = "holdback"
trigger1 = statetype != A
trigger1 = ctrl
triggerall = stateno!=105
trigger2 = stateno = 510 && time > 8

;================================

[State -1, deadly.]
type = ChangeState
value = 3000
triggerall = command = "SmashKFUpper"
triggerall = statetype != A
triggerall=power>=2000
trigger1 = ctrl
trigger2 = var(1)
trigger3 = movecontact
trigger3 = hitdefattr = SCA, NA
trigger4 = movecontact
trigger4 = stateno=1034 ||stateno=1035 ||stateno=1032||stateno=1022
trigger5=stateno=441
trigger5=enemy,stateno=446
[State -1, Super Grab]
type = ChangeState
value = 3100
triggerall = command = "TripleKFPalm"
triggerall = statetype != A
triggerall=power>=2000
trigger1 = ctrl
trigger2 = var(1)
trigger3 = movecontact
trigger3 = hitdefattr = SCA, NA
trigger4 = movecontact
trigger4 = stateno=1034 ||stateno=1035 ||stateno=1032||stateno=1022
trigger5=stateno=441
trigger5=enemy,stateno=446

[State -1, EX 6S: Quake Drop]
type = ChangeState
value = 1030
triggerall=map(EXLimiter2)=0
triggerall = power>=1000
triggerall = command = "EX"
triggerall = command = "holdfwd"
triggerall = command != "holdback"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = [300, 305] || stateno = [100, 105]
trigger4=movecontact
trigger4= stateno = 511|| stateno =512
trigger5=stateno=442&&movecontact

[State -1, 6S: Quake Drop]
type = ChangeState
value = 1020
triggerall = command = "b"
triggerall = command != "c"
triggerall = command = "holdfwd"
triggerall = command != "holdback"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = [300, 305] || stateno = [100, 105]
trigger4=movecontact
trigger4= stateno = 511|| stateno =512
trigger5=stateno=442&&movecontact

[State -1, 2EX: Malevolent Thrash]
type = ChangeState
value = 1035
triggerall=map(EXLimiter4)=0
triggerall = power>=1000
triggerall = command = "EX"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = [300, 305] || stateno = [100, 105]
trigger4=movecontact
trigger4= stateno = 511|| stateno =512
trigger5=stateno=442&&movecontact

[State -1, 2S: Malevolent Thrash]
type = ChangeState
value = 1034
triggerall = command = "b"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = [300, 305] || stateno = [100, 105]
trigger4=movecontact
trigger4= stateno = 511|| stateno =512
trigger5=stateno=442&&movecontact

[State -1, EX 5S]
type = ChangeState
value = 1014
triggerall=map(EXLimiter1)=0
triggerall = power>=1000
triggerall = command = "EX"
triggerall = command != "holdfwd"
triggerall = command != "holddown"
triggerall = command != "holdback"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = [300, 305] || stateno = [100, 105]
trigger4=stateno=442&&movecontact


[State -1, 5S]
type = ChangeState
value = 1000
triggerall = command = "b"
triggerall = command != "c"
triggerall = command != "holdfwd"
triggerall = command != "holdback"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = [300, 305] || stateno = [100, 105]
trigger4=movecontact
trigger4= stateno = 511|| stateno =512
trigger5=stateno=442&&movecontact

[State -1, 4S]
type = ChangeState
value = 1040
triggerall = command = "b"
triggerall = command != "c"
triggerall = command != "holdfwd"
triggerall = command = "holdback"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = [300, 305] || stateno = [100, 105]
trigger4=movecontact
trigger4= stateno = 511|| stateno =512
trigger5=stateno=442&&movecontact


[State -1, EX4S]
type = ChangeState
value = 1050
triggerall=map(EXLimiter3)=0
triggerall=power>=1000
triggerall = command = "EX"
triggerall = command != "holdfwd"
triggerall = command = "holdback"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = [300, 305] || stateno = [100, 105]
trigger4=movecontact
trigger4= stateno = 511|| stateno =512
trigger5=stateno=442&&movecontact

;---------------------------------------------------------------------------
;jR
[State -1, jR]
type = ChangeState
value = 650
triggerall = command = "c"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = (stateno = [600,630]) 
trigger2 = movecontact
trigger3 = stateno = 1350 

;6R
[State -1, Run Fwd]
type = ChangeState
value = 300
triggerall = command = "c"
triggerall = command != "b"
triggerall = command = "holdfwd"
triggerall = statetype != A
triggerall=stateno!=500&&stateno!=511&&stateno!=512
trigger1 = ctrl
trigger2 = stateno = [500,520] && movecontact 
trigger3 = var(1)
trigger4 = stateno =100
trigger5=stateno=442&&movecontact

;4R
[State -1, Backdash]
type = ChangeState
value = 305
triggerall = command = "c"
triggerall = command != "b"
triggerall = command = "holdback"
triggerall = statetype != A
triggerall=stateno!=500&&stateno!=511&&stateno!=512
trigger1 = ctrl
trigger2 = stateno = [500,520] && movecontact
trigger3 = var(1)
trigger4 = stateno =100
trigger5=stateno=442&&movecontact

[State -1, 5R: Charging Angel]
type = ChangeState
value = 510
triggerall = command != "holdfwd"
triggerall = command != "holdback"
triggerall = command != "holddown"
triggerall = command = "c"
triggerall = command != "b"
triggerall=stateno!=500&&stateno!=511&&stateno!=512
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=442&&movecontact

[State -1, 2R: Shatter Stomp]
type = ChangeState
value = 500
triggerall = command = "c"
triggerall = command = "holddown"
triggerall = stateno != 500
triggerall = statetype != A
triggerall=stateno!=500&&stateno!=511&&stateno!=512
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=442&&movecontact

;===========================================================================
;NORMALS 
;===========================================================================
;5L
[State -1, 5L]
type = ChangeState
value = 200
triggerall = command = "x"
triggerall = command != "holddown" && var(59) !=4
triggerall = statetype != A 
trigger1 = ctrl
trigger2 = stateno = 100
trigger3 = command = "x"
trigger3 = stateno = 400 && movecontact && prevstateno != 200

;5M: Standing Medium
[State -1, Standing Medium]
type = ChangeState
value =  210
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact ;5L
trigger3 = stateno = 400 && movecontact ;2L
trigger4 = stateno = 100
trigger5 = stateno = 410 && movecontact && prevstateno != 210
;6H: Forward Heavy
[State -1, Standing Heavy]
type = ChangeState
value =  250
trigger1 = statetype != A
triggerall = command = "z"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
trigger1 = ctrl
trigger2 = stateno = [200,220] && movecontact 
trigger3 = stateno = [400,420] && movecontact
trigger4 = stateno = 100

;5H: Standing Heavy
[State -1, Standing Heavy]
type = ChangeState
value =  220
trigger1 = statetype != A
triggerall = command = "z"
triggerall = command != "holddown"
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact ;5L
trigger3 = (stateno = 210) && movecontact ;5M
trigger4 = (stateno = 410) && movecontact ;2M
trigger5 = stateno = 400 && movecontact ;2L
trigger6 = stateno = 100
trigger7 = stateno =420 && movecontact && prevstateno != 220
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;2L: Crouching Light
[State -1, Crouching Light]
type = ChangeState
value = 400
triggerall = command = "x" || command = "x"
triggerall = command = "holddown" || command = "down"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 100
trigger3 = stateno = 400 && movecontact
trigger4 = stateno = 200 && movecontact && prevstateno != 400
;---------------------------------------------------------------------------
;2M: Crouching Medium
[State -1, Crouching Medium]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 200) 
trigger2 = (movecontact)
trigger3 = stateno = 100
trigger4 = stateno = 210 && movecontact && prevstateno != 410
;---------------------------------------------------------------------------
;Crouching Heavy (2H)
[State -1, Crouching Heavy]
type = ChangeState
value = 420
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = command != "holdfwd"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 200)|| (stateno = 210) || (stateno = 410)
trigger2 = (movecontact) ;&& enemynear, movetype = H
trigger3 = stateno = 100
trigger4 = stateno =220 && movecontact && prevstateno != 420

;---------------------------------------------------------------------------
;3H: Slide!!!
[State -1, 3H]
type = ChangeState
value = 440
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = command = "holdfwd"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 410) || (stateno = 210)  || (stateno = 200) 
trigger2 = (movecontact) ;&& enemynear, movetype = H
trigger3 = stateno = 100

;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------

;j.5L: Jumping Light
[State -1, Jumping Light]
type = ChangeState
value = 600
triggerall = command = "x"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = movecontact && stateno = 600 ;&& enemynear, movetype = H
trigger3 = stateno = 1350 ;Air blocking
trigger4=stateno=610||stateno=630
trigger4=movehit
;---------------------------------------------------------------------------
;j.5M: Jumping Medium
[State -1, Jumping Medium]
type = ChangeState
value = 610
triggerall = command = "y"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 601  ;jump_x or jump_a
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1350 ;Air blocking
trigger4=stateno=630
trigger4=movehit
;---------------------------------------------------------------------------
;j.5H: Jumping Heavy
[State -1, Jumping Heavy]
type = ChangeState
value = 630
triggerall = command = "buffer_z"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = (stateno = [600,610]) 
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1350 ;Air blocking

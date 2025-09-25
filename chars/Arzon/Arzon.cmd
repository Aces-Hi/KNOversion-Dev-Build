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
trigger2 = (stateno = [200,299]) || (stateno = [400,503]) || stateno = 656 || stateno = 670 || stateno = 630|| stateno = 610|| stateno = 600
trigger2 = movecontact ;&& enemynear, movetype = H
trigger2 = stateno!=421
trigger4 = stateno = 105 && time > 16
var(1) = 1
;---------------------------------------------------------------------------
;Wind Palm
[State -1, Triple Kung Fu Palm]
type = ChangeState
value = 3000
triggerall=stateno!=3000
triggerall = command = "TripleKFPalm"
triggerall = power >= 2000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = hitdefattr != SCA,HT
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 1030 && movecontact ;&& enemynear, movetype = H
trigger5 = stateno = 1033 && movecontact ;&& enemynear, movetype = H
trigger6 = numexplod(1000) && (var(5) <= 2)
;---------------------------------------------------------------------------
;Typhoon Slap
[State -1, Triple Kung Fu Palm]
type = ChangeState
value = 3500
triggerall=stateno!=40
triggerall = command = "SmashKFUpper"
triggerall = power >= 4000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = hitdefattr != SCA,HT
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 1030 && movecontact ;&& enemynear, movetype = H
trigger5 = stateno = 1033 && movecontact ;&& enemynear, movetype = H
;===========================================================================

[State -1, Grab]
type = ChangeState
value = 800
triggerall=stateno!=40
triggerall = command = "throwtech"
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------

;[State -1, SuperJump]
;type = ChangeState
;value = 4000
;triggerall = command = "DU"
;trigger1 = statetype != A
;trigger1 = ctrl

[State -1, DJ Stage 1: Air Detector]
type = Explod
trigger1 = !numexplod(45)
trigger1 = statetype = A
anim = 99999
ID = 45
removetime = -1


[State -1, DJ Stage 2: Up Release Detector]
type = Explod
trigger1 = numexplod(45) = 1
trigger1 = command != "holdup"
anim = 99999
ID = 45
removetime = -1


[State -1,DJC]
type = ChangeState
value = 45
triggerall = statetype=A
triggerall=map(nojump)=0
triggerall = command = "holdup"
triggerall = numexplod(45) = 2
triggerall = stateno!=45 && stateno!=46 && stateno!= 4260 && (stateno!=[4000,4099])
triggerall = var(45)
;triggerall = var(29)>0
trigger1 = ctrl && stateno!=45 && stateno!=46 && stateno!=50 && stateno!=40 && stateno!= 4260
trigger2 = movecontact ;&& enemynear, movetype = H
trigger2 = hitdefattr = A, NA
trigger3 =  stateno=45 || stateno=46|| stateno=50

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
triggerall = var(29)>-1
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
triggerall = var(29)>-1
triggerall = (pos y<-30 && vel y < 0) || (vel y >=0)


;Taunt
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = GameMode != "Training"
triggerall = command="start"
trigger1 = statetype != A
trigger1 = ctrl

[State -1, 2EX] ; 2EX
type = ChangeState
value = 1010
triggerall=map(EXLimiter1)=0
triggerall=stateno!=40
triggerall = power>=1000
triggerall = command = "EX"
triggerall = command = "holddown"
triggerall = command != "holdback"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3=enemy,movetype=H
trigger3 = numexplod(1000) && (var(5) <= 2)
trigger4=stateno=105

[State -1, 2S] ; lol whats this called
type = ChangeState
value = 1000
triggerall=stateno!=40
triggerall = command = "b"
triggerall=command!="c"
triggerall = command = "holddown"
triggerall = command != "holdback"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = numexplod(1000) && (var(5) <= 2)
trigger3 = !numexplod(10000)
trigger4=stateno=105

[State -1, j2S] 
type = ChangeState
value = 1450
triggerall=stateno!=40
triggerall = command = "b"
triggerall=command!="c"
triggerall = command = "holddown"
triggerall = command != "holdback"
triggerall = command != "holdfwd"
triggerall = statetype = A
triggerall = stateno!=1450
triggerall = stateno!=1451
triggerall = prevstateno!=1450
triggerall = prevstateno!=1451
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno=640&&movecontact

[State -1, EXj2S] 
type = ChangeState
value = 1451
triggerall=map(EXLimiter3)=0
triggerall=stateno!=40
triggerall = power>=1000
triggerall = command = "EX"
triggerall = command = "holddown"
triggerall = command != "holdback"
triggerall = command != "holdfwd"
triggerall = statetype = A
triggerall = stateno!=1450
triggerall = stateno!=1451
triggerall = prevstateno!=1450
triggerall = prevstateno!=1451
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno=640&&movecontact

[State -1, 662S]
type = ChangeState
value = 1000
triggerall=stateno!=40
triggerall = command = "buffer_b"
triggerall=command!="c"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = stateno = 100 && time >= 9
trigger2=stateno=105

[State -1, 4EX]
type = ChangeState
value = 1310
triggerall=map(EXLimiter2)=0
triggerall=stateno!=40
triggerall = NumHelper(1305) <= 0
triggerall = stateno != 1310
triggerall = power>=1000
triggerall = command = "EX"
triggerall = command != "holddown"
triggerall = command = "holdback"
triggerall = statetype != A
trigger1 = var(1)
trigger2 = ctrl
trigger3 = numexplod(1000) && (var(5) <= 2)
trigger4=stateno=105

[State -1, 4Sset] ; trap metal
type = ChangeState
value = 1300
triggerall=stateno!=40
triggerall = stateno != 1310
triggerall = NumHelper(1303) <= 0
triggerall=command!="c"
triggerall = command = "b" && command="holdback"
triggerall = statetype != A
triggerall = !numexplod(1300)
trigger1 = var(1)
trigger2 = ctrl
trigger3 = numexplod(1000) && (var(5) <= 2)
trigger4=stateno=105

[State -1, 4S] 
type = ChangeState
value = 1301
triggerall=stateno!=40
triggerall = NumHelper(1303) >= 1
triggerall=command!="c"
triggerall = command = "b" && command="holdback"
triggerall = statetype != A
triggerall = !numexplod(1301)
trigger1 = ctrl
trigger2 = var(1)
trigger3 = numexplod(1000) && (var(5) <= 2)
trigger3 = stateno != 1300
trigger3 = stateno != 1301
trigger4=stateno=105

[State -1, j4S] 
type = ChangeState
value = 1302
triggerall=stateno!=40
triggerall = NumHelper(1303) >= 1
triggerall=command!="c"
triggerall = command = "b" && command="holdback"
triggerall = statetype = A
triggerall = !numexplod(1301)
trigger1 = ctrl
trigger2 = var(1)
trigger3 = numexplod(1000) && (var(5) <= 2)
trigger3 = stateno != 1300
trigger3 = stateno != 1301
trigger4 = stateno=640&&movecontact

[State -1, 5EX] ; no longer gay; hate those people (I lied)
type = ChangeState
value = 1250
triggerall=stateno!=40
triggerall = numhelper(12050)=0
triggerall = power>=1000
triggerall = command != "holdback" && command != "holdfwd" && command != "holddown"
triggerall = command = "EX"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = numexplod(1000) && (var(5) <= 2)
trigger4=stateno=105

[State -1, 5S]
type = ChangeState
value = 1200
triggerall=stateno!=40
triggerall = !numhelper(1204)
triggerall=command!="c"
triggerall = command != "holdback" && command != "holdfwd" && command != "holddown"
triggerall = command = "b"
triggerall = statetype != A
triggerall = !numexplod(1200)
trigger1 = ctrl
trigger2 = var(1)
trigger3 = numexplod(1000) && (var(5) <= 2)
trigger4=stateno=105

[State -1, 5SS] 
type = ChangeState
value = 1201
triggerall=stateno!=40
triggerall = numhelper(1204)
triggerall = !numhelper(1205) || numexplod(1200)
triggerall=command!="c"
triggerall = command != "holdback" && command != "holdfwd" && command != "holddown"
triggerall = command = "b"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = numexplod(1000) && (var(5) <= 2)
trigger3 = !numexplod(1201)
trigger4=stateno=105

[State -1, 6S] ; Painwheel!
type = ChangeState
value = 1100
triggerall=stateno!=40
triggerall = !numHelper(1101)
triggerall = NumprojID(1102) <= 0
triggerall = command = "b" && command = "holdfwd"
triggerall = command != "holdback"
triggerall = command != "holdup"
triggerall = command != "c"
triggerall = statetype != A
triggerall = !numexplod(1100)
trigger1 = ctrl
trigger2 = var(1)
trigger3 = numexplod(1000) && (var(5) <= 2)
trigger4=stateno=105

[State -1, EX 6S] ; Now THIS is a real painwheel!
type = ChangeState
value = 1110
triggerall=stateno!=40
triggerall = !numHelper(1501)
triggerall = power>=1000
triggerall = fvar(23) = 0
triggerall =  command = "holdfwd"  
triggerall = command = "EX"
triggerall = command != "holdback"
triggerall=command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = numexplod(1000) && (var(5) <= 2)
trigger4=stateno=105

[State -1, j6S] ; Painwheel!
type = ChangeState
value = 1400
triggerall=stateno!=40
triggerall = !numHelper(1101)
triggerall = NumprojID(1102) <= 0
triggerall = command = "b" && command = "holdfwd"
triggerall = command != "holdback"
triggerall=command != "holddown"
triggerall = command != "c"
triggerall = statetype = A
triggerall = !numexplod(1100)
trigger1 = ctrl
trigger2 = var(1)
trigger3 = numexplod(1000) && (var(5) <= 2)
trigger4 = stateno=640&&movecontact

[State -1, EX j6S] ; Now THIS is a real painwheel!
type = ChangeState
value = 1410
triggerall=stateno!=40
triggerall = !numHelper(1501)
triggerall = power>=1000
triggerall = fvar(23) = 0
triggerall =  command = "holdfwd"  
triggerall = command = "EX"
triggerall = command != "holdback"
triggerall=command != "holddown"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = numexplod(1000) && (var(5) <= 2)
trigger4 = stateno=640&&movecontact

[State -1, j5S]
type = ChangeState
value = 1430
triggerall=stateno!=40
triggerall = !numhelper(1204)
triggerall = command != "holdback" && command != "holdfwd" 
triggerall=command != "holddown"
triggerall = command = "b" && command != "c"
triggerall = statetype = A
triggerall = !numexplod(1200)
trigger1 = ctrl
trigger2 = var(1)
trigger3 = numexplod(1000) && (var(5) <= 2)
trigger4 = stateno=640&&movecontact

[State -1, j5EX] ; no longer gay; hate those people (I lied)
type = ChangeState
value = 1440
triggerall=stateno!=40
triggerall = numhelper(12050)=0
triggerall = power>=1000
triggerall = command != "holdback" && command != "holdfwd" && command != "holddown"
triggerall = command = "EX"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = numexplod(1000) && (var(5) <= 2)
trigger4 = stateno=640&&movecontact

[State -1, 4R: Wind Push]
type = ChangeState
value = 1540
triggerall=stateno!=40
triggerall = stateno != 1310
triggerall = statetype != A
triggerall = command != "holddown"
triggerall = command = "holdback"
triggerall = command != "holdfwd"
triggerall = command != "b"
triggerall = command != "z"
triggerall = command = "c"
trigger1 = var(1)
trigger2 = ctrl
trigger3 = numexplod(1000) && (var(5) <= 2)
trigger3 = !numexplod(1540)


[State -1, 6R: Wind Push]
type = ChangeState
value = 1560
triggerall=stateno!=40
triggerall = statetype != A
triggerall = command != "holddown"
triggerall = command != "holdback"
triggerall = command = "holdfwd"
triggerall = command = "c"
triggerall = command != "b"
triggerall = command != "z"
trigger1 = var(1)
trigger2 = ctrl
trigger3 = numexplod(1000) && (var(5) <= 2)
trigger3 = !numexplod(1560)

[State -1, 5R: Wind Push]
type = ChangeState
value = 1520
triggerall=stateno!=40
triggerall = statetype != A
triggerall = command = "holddown"
triggerall = command != "holdback"
triggerall = command != "holdfwd"
triggerall = command = "c"
triggerall = command != "b"
triggerall = command != "z"
trigger1 = var(1)
trigger2 = ctrl
trigger3 = numexplod(1000) && (var(5) <= 2)
trigger3 = !numexplod(1520)


[State -1, 2R: Wind Push]
type = ChangeState
value = 1550
triggerall=stateno!=40
triggerall = statetype != A
triggerall = command != "holddown"
triggerall = command != "holdback"
triggerall = command != "holdfwd"
triggerall = command = "c"
triggerall = command != "b"
triggerall = command != "z"
trigger1 = var(1)
trigger2 = ctrl
trigger3 = numexplod(1000) && (var(5) <= 2)
trigger3 = !numexplod(1550)
trigger3=stateno!=1010
trigger4 = numexplod(1000) && (var(5) <= 2)
trigger4 = !numexplod(1550)
trigger4=stateno=1010&&!moveguarded
;--------------------------------------------------------------------------
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

;===========================================================================
;NORMALS BEHOLD!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;===========================================================================

;5L: Standing Light. Arzon's 5L aint mashable lol
[State -1, Standing Light]
type = ChangeState
value = 200
triggerall=stateno!=40
triggerall = command = "x"
triggerall = command != "holddown" && var(59) !=4
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = command = "x"
trigger2 = movecontact ;&& enemynear, movetype = H
trigger2 = stateno = 400 && time>1
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 101 
 
;5M: Standing Medium
[State -1, Standing Medium]
type = ChangeState
value =  210
triggerall=stateno!=40
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact ;5L
;trigger3 = stateno = 100 && time > 3
trigger3 = stateno = 400 && movecontact ;2L
trigger4 = stateno = 410 && movecontact && prevstateno!=210

;5H: Standing Heavy
[State -1, Standing Heavy]
type = ChangeState
value =  220
triggerall=stateno!=40
trigger1 = statetype != A
triggerall = command = "z"
triggerall = command != "holddown"
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact ;5L
trigger3 = (stateno = 210) && movecontact ;5M
trigger4 = (stateno = 410) && movecontact ;2M
trigger5 = (stateno = 420) && movecontact && prevstateno!=220

;6H: Standing Heavy
[State -1, Standing Heavy]
type = ChangeState
value = 230
triggerall=stateno!=40
trigger1 = statetype != A
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = command = "holdfwd"
triggerall = numhelper(230) = 0
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact ;5L
trigger3 = (stateno = 210) && movecontact ;5M
trigger4 = (stateno = 410) && movecontact ;2M
trigger5 = (stateno = 420) && movecontact ;2H

;6H: Standing Heavy
[State -1, Standing Heavy]
type = ChangeState
value =  231
triggerall=stateno!=40
triggerall = statetype != A
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = command = "holdfwd"
triggerall = numhelper(230) != 0
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact ;5L
trigger3 = (stateno = 210) && movecontact ;5M
trigger4 = (stateno = 410) && movecontact ;2M
trigger5 = (stateno = 420) && movecontact ;2H
;---------------------------------------------------------------------------
;2L: Crouching Light
[State -1, Crouching Light]
type = ChangeState
value = 400
triggerall=stateno!=40
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact ;5L
trigger3 = stateno = 400 && movecontact ;5L
;---------------------------------------------------------------------------
;2M: Crouching Medium
[State -1, Crouching Medium]
type = ChangeState
value = 410
triggerall=stateno!=40
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 200)
trigger2 = (movecontact) ;&& enemynear, movetype = H
trigger3 = stateno = 101 ;runstop
trigger4 = stateno = 210 && movecontact && prevstateno!=410
;---------------------------------------------------------------------------
;Crouching Heavy (2H)
[State -1, Crouching Heavy]
type = ChangeState
value = 420
triggerall=stateno!=40
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = command != "holdfwd"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 410)|| (stateno = 200)|| (stateno = 210) || (stateno = 430)
trigger2 = movecontact
trigger3 = (stateno = 220) && movecontact && prevstateno!=420
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------

;j.5L: Jumping Light
[State -1, Jumping Light]
type = ChangeState
value = 600
triggerall=stateno!=40
triggerall = command = "x"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = movehit && stateno = 600 ;&& enemynear, movetype = H
trigger3 = stateno = 1350 ;Air blocking
trigger4 = stateno = 630 && movehit
trigger5 = stateno = 610 && movehit
;trigger4 = stateno = 904 && time > 3
;---------------------------------------------------------------------------
;j.5M: Jumping Medium
[State -1, Jumping Medium]
type = ChangeState
value = 610
triggerall=stateno!=40
triggerall = command = "buffer_y"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 601  ;jump_x or jump_a
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1350 ;Air blocking
trigger4 = stateno = 630 && movehit

;---------------------------------------------------------------------------
;j.5H: Jumping Heavy
[State -1, Jumping Heavy]
type = ChangeState
value = 630
triggerall=stateno!=40
triggerall = command != "holdfwd"
triggerall = command = "buffer_z"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = (stateno = [600,610]) 
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1350 ;Air blocking

[State -1, j6H]
type = ChangeState
triggerall=stateno!=640
triggerall = command = "holdfwd"
triggerall = command = "buffer_z"
triggerall = statetype = A
trigger1 = ctrl 
trigger2 = (stateno = [600,610]) 
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1350 ;Air blocking
value = 640
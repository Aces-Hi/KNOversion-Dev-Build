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

[State -1, baseddept]
type = ChangeState
value = 770
triggerall = ishelper(777)
trigger1 = root, movetype = H

[State -1, Combo condition Check]
type = VarSet
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,299]) || (stateno = [400,499]) || stateno = 656
trigger2 = movecontact
trigger2 = stateno!=421 ;&& stateno!=210 
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 105 && time > 15
var(1) = 1

;===========================================================================
;===========================================================================
;===========================================================================
;=============================LVL1-LVL3 SUPERS===============================
;===========================================================================
;===========================================================================
;===========================================================================


;---------------------------------------------------------------------------

;Equanimity (Lv4)
[State -1, R]
type = ChangeState
value = 3020
triggerall = !ishelper
triggerall = command = "SmashKFUpper"
triggerall = power >= 4000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3000,3050)
trigger2 = movecontact

;Sobriety (Air Lv2)
[State -1, Triple Kung Fu Palm]
type = ChangeState
value = 3000
triggerall = stateno!=40
triggerall = !ishelper
triggerall = command = "TripleKFPalm"
triggerall = power >= 2000
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = statetype = A
trigger2 = hitdefattr = A, NA, SA
triggerall=stateno!=7501
trigger2 = stateno != [3000,3050)
trigger2 = movecontact
;---------------------------------------------------------------------------
;Super 1: 1-Inch Pawnch
[State -1, R]
type = ChangeState
value = 3010
triggerall = !ishelper
triggerall = command = "TripleKFPalm"
triggerall = power >= 2000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3000,3050)
trigger2 = movecontact

;===========================================================================
;===========================================================================
;===========================================================================
;=================================SYSTEMS==================================
;===========================================================================
;===========================================================================
;===========================================================================

[State -1, Grab]
type = ChangeState
value = 800
triggerall=stateno!=40
triggerall = !ishelper
trigger1 = command = "throwtech"
trigger1 = statetype != A
trigger1 = ctrl

[State -1,DJC]
type = ChangeState
value = 45
triggerall=statetype=A
triggerall = command = "holdupb"
triggerall =stateno!=45 && stateno!=46 && stateno!= 4260 && (stateno!=[4000,4099])
triggerall = var(29)>0
trigger1 = stateno!=640 && ctrl && stateno!=45 && stateno!=46 && stateno!=50 && stateno!=40 && stateno!= 4260
trigger2 = stateno!=640 && movecontact
trigger2 = stateno!=640 && hitdefattr = A, NA
trigger3 =  stateno!=640 && stateno=45 || stateno=46|| stateno=50
trigger3 = stateno!=640 && vel y>.1
;===========================================================================
;===========================================================================
;===========================================================================
;=============================SPECIALS & EX==================================
;===========================================================================
;===========================================================================
;===========================================================================

[State -1, 2S: Astral Rise EX]
type = ChangeState
value = 2015
triggerall=stateno!=40
triggerall = !ishelper
triggerall = command = "EX"
triggerall = power>=1000
triggerall=map(EXLimiter1)=0
triggerall = command = "holddown"
triggerall = command != "holdback"
triggerall = command != "holdfwd"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=105

[State -1, EX Revelation Lv3]
type = ChangeState
value = 1014
triggerall=stateno!=40
triggerall = !ishelper
triggerall = !ishelper
triggerall = power>=1000
triggerall=map(EXLimiter2)=0
triggerall = command = "EX"
triggerall = command = "holdfwd"
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 610 && movecontact
trigger5 = stateno = 630 && movecontact
trigger6 = stateno = 640 && movecontact
trigger7=stateno=105

[State -1, EX Ascension Lv3]
type = ChangeState
value = 1003
triggerall=stateno!=40
triggerall = !ishelper
triggerall = power>=1000
triggerall=map(EXLimiter3)=0
triggerall = command = "EX"
triggerall = command = "holdback"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=105

[State -1, EX Holy Flame Lv3]
type = ChangeState
value = 1033
triggerall=stateno!=40
triggerall = !ishelper
triggerall = numhelper(1033)=0
triggerall = power>=1000
triggerall=map(EXLimiter4)=0
triggerall = command = "EX"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=105


[State -1, Ascension Lv3]
type = ChangeState
value = 1002
triggerall=!ishelper
triggerall=stateno!=40
triggerall = fvar(19) >= 100 ;Used to be > 199, ty graganick
triggerall = command = "b"&&command != "EX"
triggerall = command = "holdback"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=105

[State -1, Ascension Lv2]
type = ChangeState
value = 1001
triggerall=!ishelper
triggerall=stateno!=40
triggerall = fvar(19) <100
triggerall = command = "b"
triggerall=command!="c"
triggerall = command = "holdback"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=105

[State -1, Ascension Palm]
type = ChangeState
value = 1000
triggerall=stateno!=40
triggerall = command = "b"
triggerall=command!="c"
triggerall = command = "holdback"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=105

[State -1, 2S: Astral Rise Lv1]
type = ChangeState
value = 2010
triggerall=stateno!=40
triggerall = !ishelper
triggerall = command = "holddown"
triggerall = statetype != A
triggerall = command = "b"
triggerall=command!="c"
trigger1 = ctrl
trigger2 = var(1)
trigger6=stateno=105

[State -1, Revelation Lv3]
type = ChangeState
value = 1012
triggerall=!ishelper
triggerall=stateno!=40
triggerall = fvar(19) >=100
triggerall = command = "b"&&command != "EX"
triggerall = command = "holdfwd"
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 610 && movecontact
trigger5 = stateno = 630 && movecontact
trigger6 = stateno = 640 && movecontact
trigger7=stateno=105
trigger8 = stateno = 600 && movehit

[State -1, Revelation Lv2]
type = ChangeState
value = 1011
triggerall=!ishelper
triggerall=stateno!=40
triggerall = fvar(19) <100
triggerall = command = "b"
triggerall=command!="c"
triggerall = command = "holdfwd"
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 610 && movecontact
trigger5 = stateno = 630 && movecontact
trigger6 = stateno = 640 && movecontact
trigger7=stateno=105
trigger8 = stateno = 600 && movehit

[State -1, Revelation]
type = ChangeState
value = 1010
triggerall=stateno!=40
triggerall = command = "b"
triggerall=command!="c"
triggerall = command = "holdfwd"
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 610 && movecontact
trigger5 = stateno = 630 && movecontact
trigger6=stateno=105
trigger7 = stateno = 600 && movehit

[State -1, Holy Flame Lv3]
type = ChangeState
value = 1032
triggerall =stateno!= 1032
triggerall=stateno!=40
triggerall = !ishelper
triggerall = helper(10322),stateno!=10322
triggerall = helper(10322),stateno!=10323
triggerall = helper(10322),stateno!=10324
triggerall = fvar(19) >= 100
triggerall = command = "b"&&command != "EX"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=105

[State -1, Holy Flame Lv2]
type = ChangeState
value = 1031
triggerall =stateno!= 1031
triggerall=stateno!=40
triggerall = !ishelper
triggerall = helper(10311),stateno!=10311
triggerall = command = "b"&&command != "EX"
triggerall=command!="c"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=105
trigger4 = fvar(19) >100
trigger4 = helper(10322),stateno=10322
trigger4=ctrl

[State -1, 5R]
type = ChangeState
value = 42000
triggerall = numexplod(893) = 0
triggerall = !ishelper
triggerall = stateno != 2000
triggerall = !numhelper(750)
triggerall = command != "holddown"
triggerall = command != "holdfwd"
triggerall = command != "holdback"
triggerall = command != "b"
trigger1 = Ctrl
triggerall = command = "buffer_c"
trigger2 = var(1)
trigger3 = stateno = [600,630]
trigger3 = movecontact
trigger4 = stateno = 640 && movecontact

[State -1, 6R]
type = ChangeState
value = 62000
triggerall=stateno!=40
triggerall = numexplod(893) = 0
triggerall = !ishelper
triggerall = stateno != 2000
triggerall = !numhelper(750)
triggerall = command = "holdfwd"
triggerall = command != "b"
trigger1 = Ctrl
triggerall = command = "buffer_c"
trigger2 = var(1)
trigger3 = stateno = [600,630]
trigger3 = movecontact
trigger4 = stateno = 640 && movecontact

[State -1, 4R]
type = ChangeState
value = 32000
triggerall=stateno!=40
triggerall = numexplod(893) = 0
triggerall = !ishelper
triggerall = stateno != 2000
triggerall = !numhelper(750)
triggerall = command = "holdback"
triggerall = command != "b"
trigger1 = Ctrl
triggerall = command = "buffer_c"
trigger2 = var(1)
trigger3 = stateno = [600,630]
trigger3 = movecontact
trigger4 = stateno = 640 && movecontact

[State -1, 2R: Tranquililty 1]
type = ChangeState
value = 12000
triggerall=stateno!=40
triggerall = numexplod(893) = 0
triggerall = !ishelper
triggerall = stateno != 2000
triggerall = !numhelper(750)
triggerall = command = "holddown"
triggerall = command != "b"
trigger1 = Ctrl
triggerall = command = "buffer_c"
trigger2 = var(1)
trigger3 = stateno = [600,630]
trigger3 = movecontact
trigger4 = stateno = 640 && movecontact

[State -1, 2R: Tranquililty 1]
type = ChangeState
value = 12000
triggerall=stateno!=40
triggerall = numexplod(893) = 0
triggerall = !ishelper
triggerall = stateno != 2000
triggerall = !numhelper(750)
triggerall = command = "holddown"
triggerall = command != "b"
trigger1 = Ctrl
triggerall = command = "buffer_c"
trigger2 = var(1)
trigger3 = stateno = [600,630]
trigger3 = movecontact
trigger4 = stateno = 640 && movecontact

;===========================================================================
;===========================================================================
;===========================================================================
;===============================MOVEMENT==================================
;===========================================================================
;===========================================================================
;===========================================================================

;---------------------------------------------------------------------------
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

;---------------------------------------------------------------------------



;===========================================================================
;===========================================================================
;===========================================================================
;================================NORMALS==================================
;===========================================================================
;===========================================================================
;===========================================================================

;Overhead
[State -1, Stand Strong Punch]
type = ChangeState
value =  7501
triggerall=stateno!=100
triggerall=stateno!=40
trigger1 = statetype != A
triggerall = command = "y"
triggerall = command = "holdfwd"
triggerall = command !="holddown"
triggerall = command !="holdup"
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact 
trigger3 = (stateno = 210) && movecontact 
trigger4 = (stateno = 400) && movecontact 
trigger5 = stateno = 410 && movecontact

;5L
[State -1, 5L]
type = ChangeState
value = 200
triggerall=stateno!=40
triggerall = command = "x"
triggerall = command != "holddown" && var(59) !=4
trigger1 = statetype != A
trigger1 = ctrl 
trigger2 = stateno = 200 && movecontact && !ishelper
trigger3 = stateno = 100
trigger4 = command = "x"
trigger4 = stateno = 400 && movecontact && !ishelper && prevstateno != 200

;5M
[State -1,5M]
type = ChangeState
value =  210
triggerall=stateno!=40
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 100
trigger3 = stateno = 410 && movecontact && !ishelper && prevstateno != 210
trigger4 = stateno = 200 && movecontact && !ishelper
trigger5 = stateno = 400 && movecontact && !ishelper

;6H
[State -1, 6H]
type = ChangeState
value =  230
triggerall=stateno!=40
triggerall = command = "z"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
trigger1 = ctrl
trigger1 = statetype != A
trigger2 = stateno = 100
trigger3 = stateno = 210 && movecontact && !ishelper
trigger4 = stateno = 410 && movecontact && !ishelper
trigger5 = stateno = 200 && movecontact && !ishelper
trigger6 = stateno = 400 && movecontact && !ishelper
trigger7 = stateno = 220 && movecontact && !ishelper
trigger8 = stateno = 420 && movecontact && !ishelper
;-----------------------------------------------------------------------------------------------------------

;5H
[State -1, 5H]
type = ChangeState
value =  220
triggerall=stateno!=40
trigger1 = statetype != A
triggerall = command = "z"
triggerall = command != "holddown"
trigger1 = ctrl
trigger2 = stateno = 100
trigger3 = stateno = 210 && movecontact && !ishelper
trigger4 = stateno = 410 && movecontact && !ishelper
trigger5 = stateno = 200 && movecontact && !ishelper
trigger6 = stateno = 400 && movecontact && !ishelper
trigger7 = stateno = 420 && movecontact && !ishelper && prevstateno != 220
;-----------------------------------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------------------------------

;2L
[State -1, 2L]
type = ChangeState
value = 400
triggerall=stateno!=40
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 400 && movecontact && !ishelper
trigger3 = stateno = 100
trigger4 = stateno = 200 && movecontact && !ishelper && prevstateno != 400
;---------------------------------------------------------------------------
;2M
[State -1, 2M]
type = ChangeState
value = 410
triggerall=stateno!=40
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 100
trigger3 = stateno = 200 && movecontact && !ishelper
trigger4 = stateno = 400 && movecontact && !ishelper
trigger5 = stateno = 210 && movecontact && !ishelper && prevstateno != 410
;---------------------------------------------------------------------------
;2H
[State -1, 2H]
type = ChangeState
value = 420
triggerall=stateno!=40
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = command != "holdfwd"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 210 && movecontact && !ishelper
trigger3 = stateno = 410 && movecontact && !ishelper
trigger4 = stateno = 200 && movecontact && !ishelper
trigger5 = stateno = 400 && movecontact && !ishelper
trigger6 = stateno = 220 && movecontact && !ishelper && prevstateno != 420
;---------------------------------------------------------------------------
;3H
[State -1, 3H]
type = ChangeState
value = 430
triggerall=stateno!=40
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = command = "holdfwd"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 210 && movecontact 
trigger3 = stateno = 410 && movecontact 
trigger4= stateno = 200 && movecontact 
trigger5 = stateno = 400 && movecontact 

;j2M
[State -1, j2M]
type = ChangeState
value = 640
triggerall = stateno!=40
triggerall = command = "buffer_y"
triggerall = command = "holddown" 
triggerall = statetype = A
triggerall = pos y<-20
trigger1 = ctrl
trigger2 = (stateno = [600,630]) 
trigger2 = movecontact
trigger3 = stateno = 1350 ;Air blocking
;-----------------------------------------------------------------------------------------------------------

;jL
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = stateno!=40
triggerall = command = "x"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 1350 ;Air blocking
trigger3 = stateno = 610 && movehit
trigger4= ishelper!=1
trigger4 = stateno = 630 && movehit
trigger4= ishelper!=1
trigger5 = stateno = 600 && movehit


;---------------------------------------------------------------------------
;jM
[State -1, jM]
type = ChangeState
value = 610
triggerall = stateno!=40
triggerall = command = "buffer_y"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 
trigger2 = movecontact
trigger3 = stateno = 1350 ;Air blocking
trigger4 = stateno = 630 && movehit



;---------------------------------------------------------------------------
;jH
[State -1, jH]
type = ChangeState
value = 630
triggerall = stateno!=40
triggerall = command = "buffer_z"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = (stateno = [600,610]) 
trigger2 = movecontact
trigger3 = stateno = 1350 ;Air blocking
;---------------------------------------------------------------------------

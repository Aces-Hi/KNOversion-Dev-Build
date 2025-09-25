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
trigger2 = (stateno = [200,299]) || (stateno = [400,503]) || stateno = 656 || stateno = 670
trigger2 = movecontact ;&& enemynear, movetype = H
trigger2 = stateno!=421
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 105 && time > 16
var(1) = 1


;===========================================================================
;236X - Judgement
[State -1, 236x]
type = ChangeState
value = 3000
triggerall=map(EXLimiter1)=0
triggerall=stateno!=40
triggerall = command = "236x"
triggerall = power >= 1000
triggerall=stateno!=3200
triggerall=var(30)<=0
triggerall = statetype != A
triggerall = hitdefattr!=SCA,NT,ST,HT
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = stateno != [3000,3050)
trigger2 = stateno != 1070
trigger2 = stateno != 1061
trigger2 = stateno != [1050,1060)
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = [100,101]
;236X - Judgement
[State -1, 236x]
type = ChangeState
value = 3000
triggerall=map(EXLimiter1)=0
triggerall=stateno!=40
triggerall = command = "236x"
triggerall = power< 2000
triggerall=stateno!=3200
triggerall = power >= 1000
triggerall=var(30)>0
triggerall = statetype != A
triggerall = hitdefattr!=SCA,NT,ST,HT
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = stateno != [3000,3050)
trigger2 = stateno != 1070
trigger2 = stateno != 1061
trigger2 = stateno != [1050,1060)
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = [100,101]

;236X - Judgement
[State -1, 236x]
type = ChangeState
value = 3001
triggerall=stateno!=40
triggerall = command = "236x"
triggerall = power >= 2000
triggerall=stateno!=3200
triggerall=var(30)>0
triggerall = statetype != A
triggerall = hitdefattr!=SCA,NT,ST,HT
trigger1 = ctrl
trigger2 = stateno != [3000,3050)
trigger2 = stateno != 1070
trigger2 = stateno != 1061
trigger2 = stateno != [1050,1060)
trigger2 = stateno !=10510
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = [100,101]

[State 1240, 214S]
type = ChangeState
value = 1070
triggerall=map(EXLimiter3)=0
triggerall=stateno!=40
triggerall = power>=1000
triggerall=var(30)<=0
triggerall=stateno!=3200
triggerall = command = "214b"
triggerall = statetype != A
triggerall = hitdefattr!=SCA,NT,ST,HT
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = stateno != [3000,3050)
trigger2 = stateno != 1070
trigger2 = stateno != 1061
trigger2 = stateno != [1050,1060)
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = [100,101]

[State 1240, 214S]
type = ChangeState
value = 1070
triggerall=map(EXLimiter3)=0
triggerall=stateno!=40
triggerall = power<2000
triggerall = power>=1000
triggerall=stateno!=3200
triggerall=var(30)>0
triggerall = command = "214b"
triggerall = statetype != A
triggerall = hitdefattr!=SCA,NT,ST,HT
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 1009 && movecontact ;&& enemynear, movetype = H 
trigger4 = stateno != [3000,3050)
trigger4 = stateno != [3001,3005)
trigger4 = stateno != [1070,3010)
trigger4 = stateno != 1061
trigger4 = stateno !=  [1050,1060)
trigger4 = stateno !=[10510,3200)
trigger4 = movecontact ;&& enemynear, movetype = H

[State 1240, j214S]
type = ChangeState
value = 1075
triggerall=map(EXLimiter4)=0
triggerall = stateno!=40
triggerall = power>=1000
triggerall=var(30)<=0
triggerall = command = "214b"
triggerall = statetype = A
triggerall=stateno!=750
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno !=[1075,3205)
trigger3 = stateno != [1051,1052)
trigger3 = movecontact ;&& enemynear, movetype = H
[State 1240, j214S]
type = ChangeState
value = 1075
triggerall=map(EXLimiter4)=0
triggerall = stateno!=40
triggerall = power<2000
triggerall = power>=1000
triggerall=var(30)>0
triggerall = command = "214b"
triggerall = statetype = A
triggerall=stateno!=750
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno !=[1075,3205)
trigger3 = stateno != [1051,1052)
trigger3 = movecontact ;&& enemynear, movetype = H

[State 1240, 214S]
type = ChangeState
value = 3200
triggerall=stateno!=40
triggerall = power>=2000
triggerall=var(30)>0
triggerall = command = "214b"
triggerall = statetype != A
triggerall = hitdefattr!=SCA,NT,ST,HT
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 1009 && movecontact ;&& enemynear, movetype = H 
trigger4 = stateno != [3000,3050)
trigger4 = stateno != [3001,3005)
trigger4 = stateno != [1070,3010)
trigger4 = stateno != 1061
trigger4 = stateno !=  [1050,1060)
trigger4 = stateno !=[10510,3200)
trigger4 = movecontact ;&& enemynear, movetype = H

[State 1240, j214S]
type = ChangeState
value = 3205
triggerall = stateno!=40
triggerall = power>=2000
triggerall=stateno!=750
triggerall=var(30)>0
triggerall = command = "214b"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno !=[1075,3205)
trigger3 = stateno != [1051,1052)
trigger3 = movecontact ;&& enemynear, movetype = H
;===============================================================================
[State -1, Grab]
type = ChangeState
value = 800
triggerall=stateno!=40
trigger1 = command ="throwtech"
trigger1 = statetype != A
trigger1 = ctrl

[State -1,DJC]
type = ChangeState
value = 45
triggerall = statetype=A
triggerall = command = "holdupb"
triggerall = command != "y"
triggerall = command != "x"
triggerall = command != "z"
triggerall = command != "a"
triggerall = command != "b"
triggerall = command != "c"
triggerall = stateno!=45 && stateno!=46 
triggerall = stateno!=904 && stateno!=903 
;triggerall = var(45)>0
triggerall = var(45)>0
trigger1 = ctrl && stateno!=45 && stateno!=46 && stateno!=50 && stateno!=40 && stateno!= 4260
trigger2 = movecontact ;&& enemynear, movetype = H
trigger2 = hitdefattr = A, NA
trigger3 =  stateno=45 || stateno=46|| stateno=50
trigger3 = vel y>.1

[State -1,DJC]
type = ChangeState
value = 45
triggerall = statetype=A
triggerall = command = "up"
triggerall = command != "y"
triggerall = command != "x"
triggerall = command != "z"
triggerall = command != "a"
triggerall = command != "b"
triggerall = command != "c"
trigger1 = stateno=904
trigger2 = stateno=903  
;triggerall = var(45)>0
triggerall = var(45)>0


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
trigger2 = movehit
trigger2 = stateno = 1002 && time > 35
trigger3 = stateno = 1052 && movehit
trigger4 = stateno = 703 && power >= 1000 || stateno = 705
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
trigger2 = movehit
trigger2 = stateno = 1002 && time > 35
trigger3 = stateno = 1052 && movehit
trigger4 = stateno = 703 && power >= 1000 || stateno = 705

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
trigger2 = stateno = 250
;Backdash
[State -1, Backdash]
type = ChangeState
value = 105
triggerall = command = "BB" || (command = "dash"&&teammode!=tag) || (command = "dash"&&teammode=tag && partner,stateno=5150)
triggerall = command = "holdback"
trigger1 = statetype != A
trigger1 = ctrl
triggerall = stateno!=105
trigger2 = stateno = 250


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
[State -1, 66>214X - Piercer: Tyrfing]
type = ChangeState
value = 1050
triggerall=stateno!=40
triggerall = command = "214x"
triggerall = power >= 2000
triggerall=stateno!=3200
triggerall=var(30)>0
triggerall = statetype != A
triggerall = hitdefattr!=SCA,NT,ST,HT
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = stateno != [3000,3050)
trigger2 = stateno != 1070
trigger2 = stateno != 1061
trigger2 = stateno != [1050,1060)
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = [100,101]

[State -1, 66>214X - Piercer: Tyrfing]
type = ChangeState
value = 1060
triggerall=map(EXLimiter2)=0
triggerall=stateno!=40
triggerall = command = "214x"
triggerall = power < 2000
triggerall=stateno!=3200
triggerall = power >= 1000
triggerall=var(30)>0
triggerall = statetype != A
triggerall = hitdefattr!=SCA,NT,ST,HT
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = stateno != [3000,3050)
trigger2 = stateno != 1070
trigger2 = stateno != 1061
trigger2 = stateno != [1050,1060)
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = [100,101]

[State -1, 214X - Wrath of Aimless]
type = ChangeState
value = 1060
triggerall=map(EXLimiter2)=0
triggerall=stateno!=40
triggerall = command = "214x"
triggerall = power >= 1000
triggerall=stateno!=3200
triggerall=var(30)<=0
triggerall = statetype != A
triggerall = hitdefattr!=SCA,NT,ST,HT
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = stateno != [3000,3050)
trigger2 = stateno != 1070
trigger2 = stateno != 1061
trigger2 = stateno != [1050,1060)
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = [100,101]

;===========================================================================
;4S - Aimless Serpent (Ground)
[State -1, Spotdodge]
type = ChangeState
value = 1010
triggerall=stateno!=40
triggerall = command = "b"
triggerall = command = "holdback"
triggerall = var(30) <= 1
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 100
trigger4=stateno=105

;4SEN - Wandering Serpent (Ground)
[State -1, Spotdodge]
type = ChangeState
value = 1011
triggerall=stateno!=40
triggerall = command = "b"
triggerall = command = "holdback"
triggerall=var(33)=0
triggerall = var(30) > 1
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger2 = movecontact
trigger3 = stateno = 100|| stateno = 101

;4SEN No enhance
[State -1, Spotdodge]
type = ChangeState
value = 1010
triggerall=stateno!=40
triggerall = command = "b"
triggerall = command = "holdback"
triggerall=var(33)>0
triggerall = var(30) > 1
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger2 = movecontact
trigger3 =  stateno = 100|| stateno = 101

;6S - Soaring Splitter: Veðrfölnir (Ground)
[State 6S: Soaring Splitter]
type = ChangeState
value = 1015
triggerall=stateno!=40
triggerall = command != "214b"
triggerall = command = "b"
triggerall = command = "holdfwd"
triggerall = command != "holdback"
triggerall = command != "holddown"
triggerall = var(30) <= 1
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1) 
trigger2 = movecontact
trigger3 =  stateno = 100|| stateno = 101
trigger4=stateno=105

[State 10160, en6S: Soaring Splitter]
type = ChangeState
value = 1016
triggerall=stateno!=40
triggerall=var(32)=0
triggerall = command != "214b"
triggerall = command = "b"
triggerall = command = "holdfwd"
triggerall = command != "holdback"
triggerall = command != "holddown"
triggerall = var(30) > 1
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 100|| stateno = 101
trigger2 = movecontact

[State 10160, en6S no enhance]
type = ChangeState
value = 1015
triggerall=stateno!=40
triggerall=var(32)>0
triggerall = command != "214b"
triggerall = command = "b"
triggerall = command = "holdfwd"
triggerall = command != "holdback"
triggerall = command != "holddown"
triggerall = var(30) > 1
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 =  stateno = 100|| stateno = 101
trigger2 = movecontact
;===========================================================================
;2S - Disengage
[State -1, DP]
type = ChangeState
value = 1000
triggerall=stateno!=40
triggerall = command = "b"
triggerall = command = "holddown"
triggerall = command != "holdback"
triggerall = var(30) <= 1
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger2 = movecontact
trigger3=stateno=105

;2SEN - Disengage
[State -1, DP]
type = ChangeState
value = 1001
triggerall=var(34)=0
triggerall=stateno!=40
triggerall = command = "b"
triggerall = command = "holddown"
triggerall = command != "holdback"
triggerall = var(30) > 1
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger2 = movecontact
trigger3 = stateno = 100|| stateno = 101

;2SEN - No Enhance
[State -1, DP]
type = ChangeState
value = 1000
triggerall=var(34)>0
triggerall=stateno!=40
triggerall = command = "b"
triggerall = command = "holddown"
triggerall = command != "holdback"
triggerall = var(30) > 1
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger2 = movecontact
trigger3 = stateno = 100|| stateno = 101

;===========================================================================
;5S: One-Inch Punch
[State -1, One Inch Punch]
type = changeState
value = 1005
triggerall=stateno!=40
triggerall = command = "b"
triggerall = statetype != A
triggerall = var(30) <= 1
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=105

;5SEN: One-Inch Punch
[State -1, One Inch Punch]
type = changeState
value = 1009
triggerall=var(31)=0
triggerall=stateno!=40
triggerall = command = "b"
triggerall = statetype != A
triggerall = var(30) > 0
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 100|| stateno = 101

;5S: One-Inch Punch no enhance
[State -1, One Inch Punch]
type = changeState
value = 1005
triggerall=var(31)>0
triggerall=stateno!=40
triggerall = command = "b"
triggerall = statetype != A
triggerall = var(30) > 0
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 100|| stateno = 101

;j5S: Jotunn's Wrath
[State -1, Jotunn's Wrath]
type = changeState
value = 1025
triggerall = stateno!=40
triggerall = command = "b"
triggerall = statetype = A
triggerall = var(30) <= 1
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = [600,630]
trigger3 = movecontact

;Enj5S: Jotunn's Wrath
[State -1, Jotunn's Wrath]
type = changeState
value = 1030
triggerall = stateno!=40 
triggerall=map(jS)=0
triggerall = command = "b"
triggerall = statetype = A
triggerall = var(30) > 0
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = [600,630]
trigger3 = movecontact

;Enj5S: Jotunn's Wrath no EN
[State -1, Jotunn's Wrath]
type = changeState
value = 1025
triggerall = stateno!=40 
triggerall=map(jS)>0
triggerall = command = "b"
triggerall = statetype = A
triggerall = var(30) > 0
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = [600,630]
trigger3 = movecontact

;jR
[State -1, Fastfall]
type = changeState
value = 650
triggerall = stateno!=40
triggerall = command = "c"
triggerall = statetype = A
triggerall = var(30) <= 1
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = [600,630]
trigger3 = movecontact

;EnjR
[State -1, Fastfall]
type = changeState
value = 651
triggerall = stateno!=40 
triggerall=map(jR)=0
triggerall = command = "c"
triggerall = statetype = A
triggerall = var(30) > 0
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = [600,630]
trigger3 = movecontact
;EnjR no EN
[State -1, Fastfall]
type = changeState
value = 650
triggerall = stateno!=40 
triggerall=map(jR)>0
triggerall = command = "c"
triggerall = statetype = A
triggerall = var(30) > 0
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = [600,630]
trigger3 = movecontact

;===========================================================================

[State -1, 2R: Striking Serpent]
type = ChangeState
value = 631
triggerall=stateno!=40
triggerall = command = "c"
triggerall = command = "holddown"
triggerall = var(30) < 1
triggerall = statetype !=A
trigger1 = var(1)
trigger2 = ctrl

[State -1, EN2R: Striking Serpent]
type = ChangeState
value = 6310
triggerall=map(2) =0
triggerall=stateno!=40
triggerall = command = "c"
triggerall = command = "holddown"
triggerall = var(30) >= 1
triggerall = statetype !=A
trigger1 = var(1)
trigger2 = ctrl
trigger3= stateno = [100,101]
[State -1, EN2R no En: Striking Serpent]
type = ChangeState
value = 631
triggerall=map(2)>0
triggerall=stateno!=40
triggerall = command = "c"
triggerall = command = "holddown"
triggerall = var(30) >= 1
triggerall = statetype !=A
trigger1 = var(1)
trigger2 = ctrl
trigger3= stateno = [100,101]

[State -1, 5R: Coiled Serpent]
type = ChangeState
value = 6300
triggerall=stateno!=40
triggerall = command = "c"
triggerall = var(30) < 1
triggerall = statetype !=A
trigger1 = var(1)
trigger2 = ctrl


[State -1, EN5R: Coiled Serpent]
type = ChangeState
value = 6301
triggerall=map(5)=0
triggerall=stateno!=40
triggerall = command = "c"
triggerall = var(30) >= 1
triggerall = statetype !=A
trigger1 = var(1)
trigger2 = ctrl
trigger3= stateno = [100,101]
[State -1, EN5R no En: Coiled Serpent]
type = ChangeState
value = 6300
triggerall=map(5)>0
triggerall=stateno!=40
triggerall = command = "c"
triggerall = var(30) >= 1
triggerall = statetype !=A
trigger1 = var(1)
trigger2 = ctrl
trigger3= stateno = [100,101]


;===========================================================================
;NORMALS
;===========================================================================

;6H: Tetsuzankou
[State -1, Forward Light]
type = ChangeState
value = 205
triggerall = map(no_rmals)=0
triggerall=stateno!=40
triggerall = command = "z"
triggerall = command = "holdfwd"
triggerall = command!= "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = [400,420] || stateno = 200 || stateno = [210,220]
trigger2 = movecontact

;5L: Standing Light
[State -1, Standing Light]
type = ChangeState
value = 200
triggerall = map(no_rmals)=0
triggerall=stateno!=40
triggerall = command = "x"
triggerall = command != "holddown" && var(59) !=4
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = command = "x"
trigger2 = movecontact ;&& enemynear, movetype = H
trigger2 = stateno = 400 
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 101 
 
;5M: Standing Medium
[State -1, Standing Medium]
type = ChangeState
value =  210
triggerall = map(no_rmals)=0
triggerall=stateno!=40
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact ;5L
;trigger3 = stateno = 100 && time > 3
trigger3 = stateno = 400 && movecontact ;2L
trigger4 = stateno = 101  ;runstop
trigger5 = stateno =410 && movecontact&&prevstateno!=210
;5H: Standing Heavy
[State -1, Standing Heavy]
type = ChangeState
value =  220
triggerall = map(no_rmals)=0
triggerall=stateno!=40
trigger1 = statetype != A
triggerall = command != "214x"
triggerall = command = "z"
triggerall = command != "holddown"
triggerall = command != "holdup"
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact ;5L
trigger3 = (stateno = 210) && movecontact ;5M
trigger4 = (stateno = 410) && movecontact ;2M
trigger5 = (stateno = 420) && movecontact &&prevstateno!=220
;trigger6 = stateno = 100 && time > 3
trigger6 = stateno = 400 && movecontact ;2L
trigger7 = stateno = [100,101] ;run and runstop

;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;2L: Crouching Light
[State -1, Crouching Light]
type = ChangeState
value = 400
triggerall = map(no_rmals)=0
triggerall=stateno!=40
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact ;5L
trigger3 = stateno = 400 && movecontact ;2L
trigger4 = stateno = 101 || stateno = 100 ;runstop

;---------------------------------------------------------------------------
;2M: Crouching Medium
[State -1, Crouching Medium]
type = ChangeState
value = 410
triggerall = map(no_rmals)=0
triggerall=stateno!=40
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 200) 
trigger2 = (movecontact) ;&& enemynear, movetype = H
trigger3 = stateno = 101 || stateno = 100 ;runstop
trigger4 = stateno =210 && movecontact&&prevstateno!=410
;---------------------------------------------------------------------------
;Crouching Heavy (2H)
[State -1, Crouching Heavy]
type = ChangeState
value = 420
triggerall = map(no_rmals)=0
triggerall=stateno!=40
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = command != "holdfwd"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 410)|| (stateno = 200)|| (stateno = 210) || (stateno = 430)
trigger2 = (movecontact) ;&& enemynear, movetype = H
trigger3 = stateno = 101 || stateno = 100
trigger4 = (stateno = 220) && movecontact &&prevstateno!=420
;---------------------------------------------------------------------------
;3H: Slide!!!
[State -1, 3H]
type = ChangeState
value = 430
triggerall = map(no_rmals)=0
triggerall=stateno!=40
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = command = "holdfwd"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 410) || (stateno = 210)  || (stateno = 200) 
trigger2 = (movecontact) ;&& enemynear, movetype = H
trigger3 = stateno = 101 ;runstop

;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------

;j.5L: Jumping Light
[State -1, Jumping Light]
type = ChangeState
value = 600
triggerall = map(no_rmals)=0
triggerall = stateno!=40
triggerall = command = "x"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 1350 ;Air blocking
;trigger4 = stateno = 904 && time > 3
trigger3 = stateno = 630 && movehit
trigger4 = stateno = 610 && movehit
trigger5 = stateno = 600 && movehit

;---------------------------------------------------------------------------
;j.5M: Jumping Medium
[State -1, Jumping Medium]
type = ChangeState
value = 610
triggerall = map(no_rmals)=0
triggerall = stateno!=40
triggerall = command = "y"
triggerall = statetype = A
triggerall = stateno!=[621,623]
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 601  ;jump_x or jump_a
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1350 ;Air blocking
trigger4 = stateno = 630 && movehit

;j.5M: Jumping Medium
[State -1, Jumping Medium]
type = ChangeState
value = 610
triggerall = map(no_rmals)=0
triggerall = stateno!=40
triggerall = command = "nobuffer_y"
triggerall = statetype = A
triggerall = stateno=[621,623]
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 601  ;jump_x or jump_a
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1350 ;Air blocking
trigger4 = stateno = 630 && movehit
;---------------------------------------------------------------------------
;j.2H: Divekick
[State -1, Jumping Slam]
type = ChangeState
value = 620
triggerall = map(no_rmals)=0
triggerall = stateno!=40
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = statetype = A
triggerall = stateno!=[621,623]
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 601 || stateno = 610 || stateno = 630
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1350 ;Air blocking

;j.2H: Divekick
[State -1, Jumping Slam]
type = ChangeState
value = 620
triggerall = map(no_rmals)=0
triggerall = stateno!=40
triggerall = command = "nobuffer_z"
triggerall = command = "holddown"
triggerall = statetype = A
triggerall = stateno=[621,623]
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 601 || stateno = 610 || stateno = 630
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1350 ;Air blocking
;---------------------------------------------------------------------------
;j.5H: Jumping Heavy
[State -1, Jumping Heavy]
type = ChangeState
value = 630
triggerall = map(no_rmals)=0
triggerall = stateno!=40
triggerall = command = "z"
triggerall = command != "holddown"
triggerall = statetype = A
triggerall = stateno!=[621,623]
trigger1 = ctrl
trigger2 = (stateno = [600,610]) 
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1350 ;Air blocking

;j.5H: Jumping Heavy
[State -1, Jumping Heavy]
type = ChangeState
value = 630
triggerall = map(no_rmals)=0
triggerall = stateno!=40
triggerall = command = "nobuffer_z"
triggerall = command != "holddown"
triggerall = statetype = A
triggerall = stateno=[621,623]
trigger1 = ctrl
trigger2 = (stateno = [600,610]) 
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1350 ;Air blocking

;---------------------------------------------------------------------------

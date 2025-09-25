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
trigger2 = (stateno = [200,299]) || (stateno = [400,499]) || stateno = 656
trigger2 = movecontact
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

;RC Jasta
[State -1, RC Jasta]
type = ChangeState
value = 690000
triggerall=enemy,stateno!=7000
triggerall = map(norc)=0
triggerall = !ishelper
triggerall = stateno!=900&&stateno!=901&&stateno!=69002&&stateno!=902
triggerall = command = "a"
triggerall = statetype != A
triggerall = movetype = A
triggerall = power>=1000
trigger1 = movehit
trigger2 =stateno=3001||stateno=3002||stateno=3006||stateno=3007
ignorehitpause=0
;RC Jasta Air
[State -1, RC Jasta Air]
type = ChangeState
value = 690001
triggerall=enemy,stateno!=7000
triggerall = map(norc)=0
triggerall = !ishelper
triggerall = stateno!=900&&stateno!=901&&stateno!=69002&&stateno!=902&&stateno!=750
triggerall = command = "a"
triggerall = statetype = A
triggerall = movetype = A
triggerall = power>=1000
trigger1 = movehit
trigger1 = stateno!=9969&&stateno!=9971
ignorehitpause=0

;RC Jasta
[State -1, RC Jasta]
type = ChangeState
value = 690002
triggerall = !ishelper
triggerall = command = "rc"
triggerall = statetype != A
triggerall = movetype = A
triggerall = power>=2000
trigger1 = moveguarded
ignorehitpause=0
;RC Jasta Air
[State -1, RC Jasta Air]
type = ChangeState
value = 690003
triggerall = !ishelper
triggerall = stateno!=900&&stateno!=901
triggerall = command = "rc"
triggerall = statetype = A
triggerall = movetype = A
triggerall = power>=2000
trigger1 = moveguarded
ignorehitpause=0

;True Buster
[State -1, BH]
type = ChangeState
value = 3015
triggerall=stateno!=40
triggerall = var(28)
triggerall = command = "TrueBuster"
triggerall = power >= 4000
triggerall=enemy,movetype!=H
trigger1 = statetype != A
trigger1 = ctrl

;Combo Buster
[State -1, BH]
type = ChangeState
value = 3020
triggerall=enemy,movetype=H
triggerall=enemy,life<=(enemy,lifemax)/4
triggerall=stateno!=40
triggerall = var(28)
triggerall = command = "TrueBuster"
triggerall = power >= 4000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3000,3050)
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 10410 || stateno = 10415 ;From blocking
trigger4=map(grab)>0

;SUPER1: Buster Horizon
[State -1, BH]
type = ChangeState
value = 3000
triggerall=stateno!=40
triggerall = !var(28)
triggerall = command = "TripleKFPalm"
triggerall = power >= 2000
triggerall= statetype != A
trigger1 = ctrl
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3000,3050)
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 10410 || stateno = 10415 ;From blocking
trigger4=map(grab)>0

;SUPER1: install buster
[State -1, BH]
type = ChangeState
value = 3005
triggerall=stateno!=40
triggerall = var(28)
triggerall = command = "TripleKFPalm"
triggerall = power >= 2000 
triggerall = statetype != A
trigger1 = ctrl
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3000,3050)
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 10410 || stateno = 10415 ;From blocking
trigger4=map(grab)>0

;---------------------------------------------------------------------------
;SUPER2: RAGE
[State -1, R]
type = ChangeState
value = 3010
triggerall=stateno!=40
triggerall = stateno !=3010 && var(28)<=0
triggerall = command = "SmashKFUpper"
triggerall = power >= 2000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3000,3050)
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 10410 || stateno = 10415 ;From blocking
trigger4=map(grab)>0


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
trigger1 = command = "throwtech"
trigger1 = statetype != A
trigger1 = ctrl


;v = 15
;value = 1000
;===========================================================================
;===========================================================================
;===========================================================================
;===============================MOVEMENT==================================
;===========================================================================
;===========================================================================
;===========================================================================

[State -1,DJC]
type = ChangeState
value = 45
triggerall = statetype=A
triggerall = command = "holdupb"
triggerall = stateno!=45 && stateno!=455 && stateno!=46 && stateno!= 4260 && (stateno!=[4000,4099])
triggerall = var(45)>0
triggerall = var(29)>0
trigger1 = stateno!= 230 && ctrl && stateno!=45 && stateno!=455 && stateno!=46 && stateno!=50 && stateno!=40 && stateno!= 4260
trigger2 = stateno!= 230 && movecontact
trigger2 = stateno!= 230 && hitdefattr = A, NA
trigger3 = stateno!= 230 && stateno=45 || stateno=455 || stateno=46|| stateno=50
trigger3 = stateno!= 230 && vel y>.1


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
[State -1, Forward Back]
type = ChangeState
value = 110
;triggerall = !var(28)
triggerall = command = "FF" || (command = "dash"&&teammode!=tag) || (command = "dash"&&teammode=tag && partner,stateno=5150)
triggerall = command != "holdback"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 250
triggerall = stateno!=110
triggerall = stateno!=105
;Forward Dash
[State -1, Forward Back]
type = ChangeState
value = 106
;triggerall = !var(28)
triggerall = command = "FF" || (command = "dash"&&teammode!=tag) || (command = "dash"&&teammode=tag && partner,stateno=5150)
triggerall = command != "holdback"
trigger1 = stateno = 1062||stateno = 1063
trigger1=time<=49
trigger1=time>=15
;Run Back
[State -1, Run Back]
type = ChangeState
value = 105
triggerall = command = "BB" || (command = "dash"&&teammode!=tag) || (command = "dash"&&teammode=tag && partner,stateno=5150)
triggerall = command = "holdback"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 250
triggerall = stateno!=105
trigger3 = stateno = 1062||stateno = 1063
trigger3=time<=49
trigger3=time>=21

[State -1, short hop]
type = ChangeState
value = 455
triggerall = command = "holdup"
trigger1 = stateno = 210 && movehit = 1
trigger2 = stateno = 420 && movehit = 1 && var(28) = 1

[State -1, JS]
type = ChangeState
value = 9969
triggerall = stateno!=40
triggerall = command = "b"
triggerall=command!="c"
trigger1 = statetype = A
trigger1 = ctrl
trigger2=stateno=[600,610]&&movecontact
trigger3=stateno=630&&movecontact


[State -1, EX JS]
type = ChangeState
value = 9971
triggerall=map(EXLimiter5)=0
triggerall = stateno!=40
triggerall = command = "EX"
triggerall=power>=1000
trigger1 = statetype = A
trigger1 = ctrl
trigger2=stateno=[600,610]&&movecontact
trigger3=stateno=630&&movecontact

;===========================================================================
;===========================================================================
;===========================================================================
;=============================SPECIALS & EX==================================
;===========================================================================
;===========================================================================
;===========================================================================

[State -1, EX 6S: Brawler Rush]
type = ChangeState
value = 90022
triggerall=map(EXLimiter7)=0
triggerall=stateno!=40
triggerall = power>=1000
triggerall = var(3)<=0
triggerall = var(28) = 1
triggerall = stateno != 230
triggerall = stateno != 431
triggerall = stateno != 225
triggerall = stateno != 229
triggerall = command = "EX"
triggerall = command = "holddown"
triggerall = command = "holdfwd"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=105
;trigger3 = (stateno = [600,640]) 
;trigger3 = movecontact

[State -1, EX 6S: Brawler Rush]
type = ChangeState
value = 90011
triggerall=map(EXLimiter8)=0
triggerall=stateno!=40
triggerall = power>=1000
triggerall = var(3)<=0
triggerall = var(28) = 1
triggerall = stateno != 230
triggerall = stateno != 431
triggerall = stateno != 225
triggerall = stateno != 229
triggerall = command = "EX"
triggerall = command = "holddown" 
triggerall = command = "holdback"
triggerall = statetype != A
trigger1 = ctrl 
trigger2 = var(1) 
trigger3=stateno=105
;trigger3 = (stateno = [600,640]) 
;trigger3 = movecontact

[State -1, EX 6S: Brawler Rush]
type = ChangeState
value = 9000
triggerall=map(EXLimiter2)=0
triggerall=stateno!=40
triggerall = power>=1000
triggerall = stateno != 230
triggerall = stateno != 431
triggerall = stateno != 225
triggerall = stateno != 229
triggerall = var(32)<=0
triggerall = !var(28)
triggerall = command = "EX"
triggerall = command = "holdfwd"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=105
;trigger3 = (stateno = [600,640]) 
;trigger3 = movecontact

[State -1, EX 6S: Brawler Rush]
type = ChangeState
value = 9100
triggerall=map(EXLimiter6)=0
triggerall=stateno!=40
triggerall = power>=1000
triggerall = var(32)<=0
triggerall = var(28)
triggerall = stateno != 230
triggerall = stateno != 431
triggerall = stateno != 225
triggerall = stateno != 229
triggerall = command = "EX"
triggerall = command = "holdfwd"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=105
;trigger3 = (stateno = [600,640]) 
;trigger3 = movecontact

[state -1, 4S Brawler Rush Finisher]
type = changestate
triggerall=stateno!=40
triggerall = ifelse(p2dist X> 0, command = "b", command = "b")
triggerall=command!="c"
triggerall = stateno != 230
triggerall = stateno != 431
triggerall = stateno != 225
triggerall = stateno != 229
triggerall = stateno = 9040 && statetype != A
trigger1 = time > 70
value = 9041

[State -1, 3S: Brawler Rush]
type = ChangeState
value = 10022
triggerall=stateno!=40
triggerall = !var(28)
triggerall=command!="c"
triggerall = stateno != 230
triggerall = stateno != 431
triggerall = stateno != 225
triggerall = stateno != 229
triggerall = command = "b" && var(28) = 1
triggerall = command = "holddown"
triggerall = command = "holdfwd"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)  
trigger3=stateno=105

[State -1, 6S: Brawler Rush]
type = ChangeState
value = 2002
triggerall=stateno!=40
triggerall = var(28)
triggerall = stateno != 230
triggerall=command!="c"
triggerall = stateno != 431
triggerall = stateno != 225
triggerall = stateno != 229
triggerall = command = "b"
triggerall = command = "holddown"
triggerall = command = "holdfwd"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=105

[State -1, 1S: Brawler Rush Install]
type = ChangeState
value = 10011
triggerall=stateno!=40
triggerall = !var(28)
triggerall=command!="c"
triggerall = stateno != 230
triggerall = stateno != 431
triggerall = stateno != 225
triggerall = stateno != 229
triggerall = command = "b"&& var(28) = 1
triggerall = command = "holddown"
triggerall = command = "holdback"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=105
;trigger3 = (stateno = [600,640]) 
;trigger3 = movecontact

[State -1, 6S: Brawler Rush]
type = ChangeState
value = 1000
triggerall=stateno!=40
triggerall = stateno != 230
triggerall=command!="c"
triggerall = stateno != 431
triggerall = stateno != 225
triggerall = stateno != 229
triggerall = !var(28)
triggerall = command = "b"
triggerall = command = "holdfwd"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=105


[State -1, 6S: Brawler Rush]
type = ChangeState
value = 2001
triggerall=stateno!=40
triggerall = stateno != 230
triggerall = stateno != 431
triggerall = stateno != 225
triggerall = stateno != 229
triggerall = var(28)
triggerall = command = "b"
triggerall=command!="c"
triggerall = command = "holddown"
triggerall = command = "holdback"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=105
;trigger3 = (stateno = [600,640]) 
;trigger3 = movecontact

[State -1, 6S: Brawler Rush]
type = ChangeState
value = 2000
triggerall=stateno!=40
triggerall = var(28)
triggerall = stateno != 230
triggerall = stateno != 431
triggerall = stateno != 225
triggerall = stateno != 229
triggerall = command = "b"
triggerall=command!="c"
triggerall = command = "holdfwd"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=105
;trigger3 = (stateno = [600,640]) 
;trigger3 = movecontact

[state -1, 4S Primal Rage  Finisher]
type = changestate
triggerall=stateno!=40
triggerall =  command = "b"
triggerall=command!="c"
triggerall = stateno != 230
triggerall = stateno != 225
triggerall = stateno != 229
triggerall = stateno != 431
triggerall = stateno = 1040 && statetype != A
trigger1 = time > 52
value = 1041

;-------------------------------------------------------------------------

[State -1, EX 5S: Big Fist]
type = ChangeState
value = 9090
triggerall=map(EXLimiter1)=0
triggerall=stateno!=40
triggerall = power>=1000
triggerall = var(53)<=0
triggerall = stateno != 230
triggerall = stateno != 431
triggerall = stateno != 225
triggerall = stateno != 229
triggerall = command = "EX"
triggerall = command != "holdback"
triggerall = command != "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = [1000,1001] && movecontact
trigger3 = stateno = [9000,9001] && movecontact
trigger4 = stateno = [2000,2001] && movecontact
trigger5 = var(1)
trigger6=stateno=105

[State -1, 5S: Big Fist]
type = ChangeState
value = 1090
triggerall=stateno!=40
triggerall = stateno != 230
triggerall = stateno != 431
triggerall = stateno != 225
triggerall = stateno != 229
triggerall = command = "b"
triggerall=command!="c"
triggerall = command != "holdback"
triggerall = command != "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = [1000,1001] && movecontact
trigger3 = stateno = [9000,9001] && movecontact
trigger4 = stateno = [2000,2001] && movecontact
trigger5 = var(1)
trigger6=stateno=105
ignorehitpause = 1

[State -1, 2S: Raging Counter]
type = ChangeState
value = 1051
triggerall=stateno!=40
triggerall = stateno != 431
triggerall = stateno != 225
triggerall = stateno != 229
triggerall = command = "b"
triggerall = command = "holddown"
triggerall = command != "holdback"
triggerall = command != "c"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = [1000,1001] && movecontact
trigger3 = stateno = [9000,9001] && movecontact
trigger4 = stateno = [2000,2001] && movecontact
trigger5 = var(1)
trigger6=stateno=105
ignorehitpause = 1


[State -1, EX 2S: Raging Counter]
type = ChangeState
value = 9061
triggerall=map(EXLimiter3)=0
triggerall=stateno!=40
triggerall = stateno != 431
triggerall = stateno != 225
triggerall = stateno != 229
triggerall = power>=1000
triggerall = command = "EX"
triggerall = command = "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = [1000,1001] && movecontact
trigger3 = stateno = [9000,9001] && movecontact
trigger4 = stateno = [2000,2001] && movecontact
trigger5 = var(1)
trigger6=stateno=105
ignorehitpause = 1


;[State -1, Install 2S: Raging DP]
;type = ChangeState
;value = 1051
;triggerall = stateno != 230
;triggerall = stateno != 431
;triggerall = stateno != 225
;triggerall = command = "b"
;triggerall = command = "holddown"
;triggerall = command != "holdback"
;triggerall = command != "c"
;triggerall = var(28) = 1
;trigger1 = statetype != A
;trigger1 = ctrl
;trigger2 = stateno = [1000,1001] && movecontact
;trigger3 = stateno = [9000,9001] && movecontact
;trigger4 = stateno = [2000,2001] && movecontact
;trigger5 = var(1)
;
;[State -1, Install EX 2S: Raging DP But Angrier]
;type = ChangeState
;value = 9061
;triggerall = power>=1000
;triggerall = stateno != 230
;triggerall = stateno != 431
;triggerall = stateno != 225
;triggerall = command = "b"
;triggerall = command = "c"
;triggerall = command = "holddown"
;triggerall = command != "holdback"
;triggerall = var(28) = 1
;trigger1 = statetype != A
;trigger1 = ctrl
;trigger2 = stateno = [1000,1001] && movecontact
;trigger3 = stateno = [9000,9001] && movecontact
;trigger4 = stateno = [2000,2001] && movecontact
;trigger5 = var(1)



[State -1, EX 4S: Brutaller Angrier Pisseder Fucker You Grab]
type = ChangeState
value = 10414
triggerall=map(EXLimiter4)=0
triggerall=stateno!=40
triggerall = power>=1000
triggerall = stateno != 431
triggerall = stateno != 225
triggerall = stateno != 229
triggerall = var(31)<=0
triggerall = stateno != 230
triggerall = command = "holdback" 
triggerall = command = "EX"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = [1000,1001] && movecontact
trigger3 = stateno = [9000,9001] && movecontact
trigger4 = stateno = [2000,2001] && movecontact
trigger5 = var(1)
trigger6=stateno=105

[State -1, 4S: Brutal Angry Piss Fuck You Grab]
type = ChangeState
value = 10400
triggerall=stateno!=40
triggerall = stateno != 230
triggerall = stateno != 431
triggerall = stateno != 225
triggerall = stateno != 229
triggerall=command!="c"
triggerall = command = "b" && command="holdback"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = [1000,1001] && movecontact
trigger3 = stateno = [9000,9001] && movecontact
trigger4 = stateno = [2000,2001] && movecontact
trigger5 = var(1)
trigger6=stateno=105

;===========================================================================
;===========================================================================
;===========================================================================
;=============================BREAKER ATK==================================
;===========================================================================
;===========================================================================
;===========================================================================

[State -1, 5R: Rage Charge]
type = ChangeState
value = 1060
triggerall=stateno!=40
triggerall = StateType != A
triggerall = stateno != 1060
triggerall = stateno != 9020
triggerall = stateno != 230
triggerall = stateno != 431
triggerall = stateno != 225
triggerall = stateno != 229
triggerall = command != "holddown"
triggerall = command != "holdback"
triggerall = command != "holdfwd"
triggerall = command = "c"
triggerall = command != "b"
trigger1 = Ctrl


[State -1, 4R: Overhead]
type = ChangeState
value = 1062
triggerall=stateno!=40
triggerall = !var(28)
triggerall = stateno != 1060
triggerall = command != "holddown"
triggerall = command != "holdfwd"
triggerall = command = "c"
triggerall=command!="b"
triggerall = command = "holdback"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [1000,1001]) 
trigger2 = movecontact
trigger3 = (stateno = [9000,9001])
trigger3 = movecontact
trigger4 = stateno = [2000,2001]
trigger4 = movecontact
trigger5 = stateno = [9100,9101]
trigger5 = movecontact
trigger6 = stateno = 10011 && movecontact
trigger7 = stateno = 20011 && movecontact
trigger8 = stateno = 90011 && movecontact
trigger9 = stateno = 91011 && movecontact
trigger10 = stateno = 220 && movecontact 
trigger11 = stateno = 420 && moveguarded 
trigger12 = stateno = 110 && time > 7 
trigger13 = stateno = 111
trigger14 = stateno = 226 && movecontact

[State -1, Install 4R: Overhead]
type = ChangeState
value = 1063
triggerall=stateno!=40
triggerall = var(28)
triggerall = stateno != 1060
triggerall = command != "holddown"
triggerall = command != "holdfwd"
triggerall = command = "c"
triggerall=command!="b"
triggerall = command = "holdback"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [1000,1001]) 
trigger2 = movecontact
trigger3 = (stateno = [9000,9001])
trigger3 = movecontact
trigger4 = stateno = [2000,2001]
trigger4 = movecontact
trigger5 = stateno = [9100,9101]
trigger5 = movecontact
trigger6 = stateno = 10011 && movecontact
trigger7 = stateno = 20011 && movecontact
trigger8 = stateno = 90011 && movecontact
trigger9 = stateno = 91011 && movecontact
trigger10 = stateno = 220 && movecontact 
trigger11 = stateno = 420 && moveguarded 
trigger12 = stateno = 110 && time > 7 
trigger13 = stateno = 111
trigger14 = stateno = 421 && movecontact
trigger15 = stateno = 226 && movecontact

[State -1, 6R: Twirl]
type = ChangeState
value = 1070
triggerall=!movehit
triggerall=stateno!=40
triggerall = command != "holddown"
triggerall = command != "holdback"
triggerall = command = "c"
triggerall=command!="b"
triggerall = command = "holdfwd"
triggerall = stateno != 230
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = [1000,1001]
trigger3 = movecontact
trigger4 = stateno = [9000,9001]
trigger4 = movecontact
trigger5 = stateno = [2000,2001]
trigger5 = movecontact
trigger6 = stateno = [9100,9101]
trigger6 = movecontact
trigger7 = stateno = 10011 && movecontact
trigger8 = stateno = 20011 && movecontact
trigger9 = stateno = 90011 && movecontact
trigger10 = stateno = 91011 && movecontact
trigger11 = stateno = 110 && time > 7
trigger12 = stateno = 111

[State -1, 6R: Slow Twirl]
type = ChangeState
value = 1075
triggerall=movehit
triggerall=stateno!=40
triggerall = command != "holddown"
triggerall = command != "holdback"
triggerall = command = "c"
triggerall=command!="b"
triggerall = command = "holdfwd"
triggerall = stateno != 230
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = [1000,1001]
trigger3 = movecontact
trigger4 = stateno = [9000,9001]
trigger4 = movecontact
trigger5 = stateno = [2000,2001]
trigger5 = movecontact
trigger6 = stateno = [9100,9101]
trigger6 = movecontact
trigger7 = stateno = 10011 && movecontact
trigger8 = stateno = 20011 && movecontact
trigger9 = stateno = 90011 && movecontact
trigger10 = stateno = 91011 && movecontact
trigger11 = stateno = 110 && time > 7
trigger12 = stateno = 111

;===========================================================================
;---------------------------------------------------------------------------
;Taunt
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = GameMode != "Training"
triggerall = command = "start"
trigger1 = statetype != A
trigger1 = ctrl

;===========================================================================
;===========================================================================
;===========================================================================
;================================NORMALS==================================
;===========================================================================
;===========================================================================
;===========================================================================

;6M - Overhead
[State -1, Stand Strong Punch]
type = ChangeState
value =  750
triggerall=stateno!=40
trigger1 = statetype != A
triggerall = command = "y"
triggerall = command = "holdfwd"
triggerall = command !="holddown"
triggerall = command !="holdup"
triggerall=stateno!=110
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact ;&& enemynear, movetype = H 
trigger3 = (stateno = 210) && movecontact ;&& enemynear, movetype = H 
trigger4 = (stateno = 400) && movecontact ;&& enemynear, movetype = H 
trigger5 = stateno = 410 && movecontact ;&& enemynear, movetype = H 
trigger6 = stateno = [1000,1001] && movecontact
trigger7 = stateno = [9000,9001] && movecontact 
trigger8 = stateno = [9100,9101] && movecontact
trigger9 = stateno = [2000,2001] && movecontact
trigger10 = stateno = 111

;5L
[State -1, 5L]
type = ChangeState
value = 200
triggerall=stateno!=40
triggerall = command = "x"
triggerall = command != "holddown" && var(59) !=4
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = command = "x"
trigger2 = movecontact 
trigger2 = (stateno = 200) 
trigger2 = movecontact 
trigger3 = stateno = 100 && time > 3
trigger4 = stateno = 110 && time > 7
trigger5 = stateno = 111
trigger6 = command = "buffer_x"
trigger6 = (stateno = 400) &&prevstateno!=200&& movecontact 

;5M
[State -1,5M]
type = ChangeState
value =  210
triggerall=stateno!=40
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact 
trigger3 = stateno = 100 && time > 3
trigger4 = stateno = 110 && time > 8
trigger5 = stateno = 111
trigger6 = stateno = 400 && movecontact
trigger7 = (stateno = 410) &&prevstateno!=210&& movecontact 

;6H
[State -1, 6H]
type = ChangeState
value =  230
triggerall=stateno!=40
trigger1 = statetype != A
triggerall = command = "z"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact 
trigger3 = (stateno = 210) && movecontact 
trigger3 = (stateno = 220) && movecontact 
trigger4 = (stateno = 410) && movecontact 
trigger5 = (stateno = 420) && movecontact 
trigger5 = (stateno = 430) && movecontact 
trigger6 = (stateno = 2000) && movecontact 
trigger6 = stateno = 100 && time > 3
trigger7 = stateno = 110 && time > 7
trigger8 = stateno = 111
trigger9 = stateno = [1000,1001] && movecontact 
trigger10 = stateno = [9000,9001] && movecontact 
trigger11 = stateno = [2000,2001] && movecontact

;5H
[State -1, 5H]
type = ChangeState
value =  220
triggerall=stateno!=40
triggerall = statetype != A
triggerall = command = "z"
triggerall = command != "holddown"
triggerall = command != "holdfwd"
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact 
trigger3 = (stateno = 210) && movecontact 
trigger4 = (stateno = 410) && movecontact 
trigger5 = (stateno = 420) &&prevstateno!=220 && movecontact 
trigger6 = stateno = 100 && time > 3
trigger7 = stateno = 110 && time > 7
trigger8 = stateno = 111

[State -1, Hmash]
type = ChangeState
value = 225
triggerall=stateno!=40
triggerall = statetype != A
triggerall = command = "c"
triggerall=command!="b"
triggerall = command = "holddown"
trigger1 = ctrl
trigger2 = stateno = [200,421] & movecontact
trigger2 = stateno != [225,227] & movecontact
triggerall = stateno != 229

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
trigger2 = (stateno = 400)
trigger2 = movecontact 
trigger3 = stateno = 100 && time > 3
trigger4 = stateno = 110 && time > 7
trigger5 = stateno = 111
trigger6 = (stateno = 200) &&prevstateno!=400&& movecontact 

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
trigger2 = (stateno = 400) || (stateno = 200) 
trigger2 = (movecontact)
trigger3 = stateno = 100 && time > 3
trigger4 = stateno = 110 && time > 7
trigger5 = stateno = 111
trigger6 = (stateno = 210) &&prevstateno!=410&& movecontact 
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
trigger2 = (stateno = 400) || (stateno = 410)|| (stateno = 200)|| (stateno = 210)|| (stateno = 430)
trigger2 = (movecontact)
trigger3 = stateno = 100 && time > 3
trigger4 = stateno = 110 && time > 7
trigger5 = stateno = 111
trigger6 = (stateno = 220) &&prevstateno!=420&& movecontact 

;Charge 2H
[State -1, 2HH]
type = ChangeState
value = 421
triggerall=var(39)=0
triggerall=stateno!=40
triggerall = command = "z"
triggerall = command != "holdfwd"
triggerall = command = "holddown"
triggerall = stateno !=421
triggerall = statetype != A 
trigger1 = stateno = 420 && movecontact
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
trigger2 = (stateno = 400) || (stateno = 410) || (stateno = 210)  || (stateno = 200) || (stateno = 220)
trigger2 = (movecontact)
trigger3 = stateno = 100 && time > 3
trigger4 = stateno = 110 && time > 7
trigger5 = stateno = 111
trigger6 = stateno = [1000,1001] && movecontact
trigger7 = stateno = [9000,9001] && movecontact
trigger8 = stateno = [2000,2001] && movecontact

;-----------------------------------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------------------------------

;jL
[State ]
type = ChangeState
value = 600
triggerall = stateno!=40
triggerall = command = "x"
triggerall = statetype = A
triggerall = stateno !=1052
triggerall = stateno !=900
trigger1 = ctrl
trigger2 = movecontact && stateno !=630 && stateno !=750
trigger2 = movecontact && stateno = 45
trigger2 = movecontact && stateno = 46
trigger3 = stateno = 1350 ;Air blocking
trigger4 = stateno = 630 && movehit
trigger5 = stateno = 610 && movehit
trigger6 = stateno = 600 && movehit

;---------------------------------------------------------------------------
;jM
[State -1, jM]
type = ChangeState
value = 610
triggerall = stateno!=40
triggerall = command = "buffer_y"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 601  ;jump_x or jump_a
trigger2 = movecontact
trigger5 = movecontact && stateno = 45
trigger6 = movecontact && stateno = 46
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
;jR
[State -1, jR]
type = ChangeState
value = 650
triggerall = var(28)
triggerall = stateno!=40
triggerall = stateno!=650
triggerall = command != "EX"
triggerall = command = "buffer_c"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = (stateno = [600,630]) 
trigger2 = movecontact
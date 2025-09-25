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
trigger2 = movecontact ;&& enemynear, movetype = H
trigger2 = stateno!=421
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 105 && time > 15
var(1) = 1


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

;---------------------------------------------------------------------------
;Ourobubbles
[State -1, Ourobubbles]
type = ChangeState
value = 3050
triggerall=stateno!=40
triggerall = command = "SmashKFUpper"
triggerall = power >= 2000
triggerall = !numhelper(3051)
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = movecontact ;&& enemynear, movetype = H
;trigger3 = (stateno = [200,499]) && movecontact

;Fetid Furball
[State -1, Fetid Furball]
type = ChangeState
value = 4000
triggerall=stateno!=40
triggerall = command = "TripleKFPalm"
triggerall = power >= 2000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = movecontact && enemynear, movetype = H
trigger3 = (stateno = [200,499]) && movecontact ;&& enemynear, movetype = H
trigger4 = stateno = 1053
trigger5 = stateno = 1063
triggerall = stateno != 4000

;---------------------------------------------------------------------------

[State -1, Burst]
type = ChangeState
value = 900
triggerall = alive
triggerall = statetype != L
triggerall = map(burst)=0
triggerall = command = "burst"
triggerall = movetype = H 
triggerall = stateno!=[140,160]
;Average battle
trigger1 = enemynear,hitdefattr = SCA, NA, SA, NP, SP
;Wu support
trigger2 = enemynear, numhelper(777)
trigger2 = enemynear, hitdefattr != SCA, HA, HP, NT, ST, HT
[State -1, Panic Burst]
type = ChangeState
value = 901
triggerall = alive
triggerall = statetype != L
triggerall = map(burst)=1
triggerall = map(panic)=0
triggerall = power>=4000
triggerall = command = "burst"
triggerall = movetype = H 
triggerall = stateno!=[140,160]
;Average battle
trigger1 = enemynear,hitdefattr = SCA, NA, SA, NP, SP
;Wu support
trigger2 = enemynear, numhelper(777)
trigger2 = enemynear, hitdefattr != SCA, HA, HP, NT, ST, HT

;[State -1, SuperJump]
;type = ChangeState
;value = 4000
;triggerall = command = "DU"
;trigger1 = statetype != A
;trigger1 = ctrl

;===========================================================================
;===========================================================================
;===========================================================================
;=============================SPECIALS & EX==================================
;===========================================================================
;===========================================================================
;===========================================================================

[State -1, EX 6S: Rising Knee]
type = ChangeState
value = 1060
triggerall=map(EXLimiter2)=0
triggerall=stateno!=40
triggerall=stateno!=6000
triggerall=stateno!=6010
triggerall=stateno!=6011
triggerall=stateno!=6012
triggerall=stateno!=6013
triggerall=stateno!=6014
triggerall=stateno!=6015
triggerall=stateno!=6016
triggerall = stateno!=2062
triggerall=stateno!=1061
triggerall = var(32)<=0 ;Limiter - Only Allowed to use ONCE during a combo
triggerall = power>=1000
triggerall = command = "EX"
triggerall = command = "holdfwd"
triggerall = command != "holdback"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
;trigger3 = movecontact ;&& enemynear, movetype = H
;trigger3 = !ishelper
;trigger4 = stateno = 5120
trigger3 = stateno = 1017 && movecontact ;&& enemynear, movetype = H
trigger4=stateno=105

[State -1, EX 6S: Rising Knee (Air)]
type = ChangeState
value = 1064
triggerall=map(EXLimiter2)=0
triggerall = stateno!=40
triggerall=stateno!=6000
triggerall=stateno!=6010
triggerall=stateno!=6011
triggerall=stateno!=6012
triggerall=stateno!=6013
triggerall=stateno!=6014
triggerall=stateno!=6015
triggerall=stateno!=6016
triggerall=stateno!=1061
triggerall=stateno!=750
triggerall = var(32)<=0 ;Limiter - Only Allowed to use ONCE during a combo
triggerall = power>=1000
;triggerall = command = "b"
;triggerall = command = "c"
triggerall = command = "EX"
triggerall = command = "holdfwd"
triggerall = command != "holdback"
triggerall = statetype != S
triggerall = statetype = A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = [600,650]
trigger3 = movecontact ;&& enemynear, movetype = H

[State -1, 6S: Rising Knee]
type = ChangeState
value = 1065
triggerall = stateno!=40
triggerall = Pos Y < -20
triggerall = command = "b"
triggerall=command!="c"
triggerall = command = "holdfwd"
triggerall = command != "holdback"
triggerall = statetype != S
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = [600,650]
trigger2 = movecontact ;&& enemynear, movetype = H


[State -1, 6S: Rising Knee]
type = ChangeState
value = 1050
triggerall=stateno!=40
triggerall = stateno != 52
triggerall = command = "b"
triggerall=command!="c"
triggerall = command = "holdfwd"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 100
trigger4 = stateno = 1010
trigger4 = movecontact ;&& enemynear, movetype = H
trigger5 = stateno = 1017 && movecontact ;&& enemynear, movetype = H
trigger6=stateno=105
;-------------------------------------------------------------------------

[State -1, EX 2S: Acid Stomp]
type = ChangeState
value = 1011
triggerall=map(EXLimiter4)=0
triggerall=stateno!=40
triggerall=stateno!=6000
triggerall=stateno!=6010
triggerall=stateno!=6011
triggerall=stateno!=6012
triggerall=stateno!=6013
triggerall=stateno!=6014
triggerall=stateno!=6015
triggerall=stateno!=6016
triggerall=numhelper(6002)!=1
triggerall = var(31)<=0 ;Limiter - Only Allowed to use ONCE during a combo
triggerall = power>=1000
;triggerall = command = "b"
;triggerall = command = "c"
triggerall = command = "EX"
triggerall = command = "holddown"
triggerall = command != "holdback"
trigger1 = statetype != A
trigger1 = stateno != 1064
trigger1 = stateno != 1050
trigger1 = ctrl
trigger2 = var(1)
;trigger3 = movecontact ;&& enemynear, movetype = H
;trigger3 = stateno = 1010
trigger3 = stateno = 1017 && movecontact ;&& enemynear, movetype = H
trigger4=stateno=105


[State -1, 2S: Acid Stomp]
type = ChangeState
value = 1010
triggerall=!numhelper(2054)||Helper(2054),rootdist x != [-100,100]
triggerall=stateno!=40
triggerall = stateno !=1017
triggerall = command = "b"
triggerall=command!="c"
triggerall = command = "holddown"
triggerall = command != "holdback"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=105

[State -1, 2S: Acid Stomp]
type = ChangeState
value = 1017
triggerall=numhelper(2054) && Helper(2054),rootdist x = [-100,100]
triggerall=stateno!=40
triggerall = stateno !=1017
triggerall = command = "b"
triggerall=command!="c"
triggerall = command = "holddown"
triggerall = command != "holdback"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=105

;-------------------------------------------------------------------------

[State -1, EX 4S: xxx]
type = ChangeState
value = 2059
triggerall=map(EXLimiter3)=0
triggerall=stateno!=40
triggerall=stateno!=6000
triggerall=stateno!=6010
triggerall=stateno!=6011
triggerall=stateno!=6012
triggerall=stateno!=6013
triggerall=stateno!=6014
triggerall=stateno!=6015
triggerall=stateno!=6016
triggerall = numhelper(2053)!=1
triggerall = var(34)<=0 ;Limiter - Only Allowed to use ONCE during a combo
triggerall = power>=1000
triggerall = command = "EX"
triggerall = command="holdback" 
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 1010
trigger3 = movecontact ;&& enemynear, movetype = H
trigger4=stateno=105

[State -1, 4S: Acid Grab]
type = ChangeState
value = 2050
triggerall=stateno!=40
triggerall = command = "b" && command="holdback"
triggerall=command!="c"
trigger1 = statetype != A
trigger1 = ctrl
trigger2=stateno=105

;-------------------------------------------------------------------------

[State -1, j5S: (Air) Rayzah]
type = ChangeState
value = 1600
triggerall = stateno!=40
triggerall = NumProjID(9002) = 0
triggerall = numhelper(1005) != 1
triggerall = numhelper(1025) != 1
triggerall = numhelper(1605) != 1
triggerall = stateno != 1605
triggerall = command = "b"
triggerall=command!="c"
triggerall = command != "holdfwd"
triggerall = statetype != S
triggerall = statetype = A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = [600,650]
trigger3 = movecontact ;&& enemynear, movetype = H

[State -1, j5SEX: (Air) Rayzah]
type = ChangeState
value = 1030
triggerall=map(EXLimiter5)=0
triggerall = stateno!=40
triggerall=power>=1000
triggerall = stateno != 1605
triggerall = command = "EX"
triggerall = command != "holdfwd"
triggerall = statetype != S
triggerall = statetype = A
triggerall = numhelper(1035) != 1
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = [600,650]
trigger3 = movecontact ;&& enemynear, movetype = H

[State -1, 5S: EX Acid Razor]
type = ChangeState
value = 1020
triggerall=map(EXLimiter1)=0
triggerall=stateno!=40
triggerall=stateno!=6000
triggerall=stateno!=6010
triggerall=stateno!=6011
triggerall=stateno!=6012
triggerall=stateno!=6013
triggerall=stateno!=6014
triggerall=stateno!=6015
triggerall=stateno!=6016
triggerall=power>=1000
triggerall = numhelper(1025) != 1
triggerall = stateno != 1025
triggerall = stateno != 1020
triggerall = command = "EX"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
;trigger3 = stateno = 1010
;trigger3 = movecontact ;&& enemynear, movetype = H
;trigger4 = stateno=1000
trigger3 = stateno=1017 && movecontact ;&& enemynear, movetype = H
trigger4=stateno=105

[State -1, 5S: Acid Razor]
type = ChangeState
value = 1000
triggerall=stateno!=40
triggerall = NumProjID(9002) = 0
triggerall = enemynear, stateno != 5110
triggerall = numhelper(1605) != 1
triggerall = numhelper(1005) != 1
triggerall = numhelper(1025) != 1
triggerall=stateno!=6016
triggerall = command = "b"
triggerall=command!="c"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=105

;===========================================================================
;===========================================================================
;===========================================================================
;=============================BREAKER ATK==================================
;===========================================================================
;===========================================================================
;===========================================================================

[State -1, nB: Acid Bubble]
type = ChangeState
value =6000
triggerall=stateno!=40
;triggerall = enemynear(0), movetype != H
triggerall = var(11)<=1
triggerall = numhelper(6001) = 0
triggerall = stateno != 6008
triggerall = stateno != 6009
triggerall = stateno != 6000
triggerall = stateno != 6001
triggerall = stateno != 6005
triggerall = stateno != 6002
triggerall=command!="b"
triggerall = command != "holddown"
triggerall = command != "holdback"
triggerall = command != "holdfwd"
triggerall = command != "holdup"
triggerall = command = "buffer_c"
triggerall = StateType != A
trigger1 = statetype != A
trigger1 = ctrl
trigger2= var(1)

[State -1, nB: F Acid Bubble]
type = ChangeState
value =6010
triggerall=stateno!=40
;triggerall = enemynear(0), movetype != H
triggerall = var(11)<=1
triggerall = numhelper(6001) = 0
triggerall = stateno != 6008
triggerall = stateno != 6009
triggerall = stateno != 6000
triggerall = stateno != 6001
triggerall = stateno != 6005
triggerall = stateno != 6002
triggerall = command != "holddown"
triggerall = command != "holdback"
triggerall = command != "holdup"
triggerall=command!="b"
triggerall = command = "buffer_c"&& command="holdfwd"
triggerall = StateType != A
trigger1 = statetype != A
trigger1 = ctrl
trigger2= var(1)

[State -1, nB: B Acid Bubble]
type = ChangeState
value =6011
triggerall=stateno!=40
;triggerall = enemynear(0), movetype != H
triggerall = var(11)<=1
triggerall = numhelper(6001) = 0
triggerall = stateno != 6008
triggerall = stateno != 6009
triggerall = stateno != 6000
triggerall = stateno != 6001
triggerall = stateno != 6005
triggerall = stateno != 6002
triggerall=command!="b"
triggerall = command != "holddown"
triggerall = command != "holdfwd"
triggerall = command != "holdup"
triggerall = command = "buffer_c"&& command="holdback"
triggerall = StateType != A
trigger1 = statetype != A
trigger1 = ctrl
trigger2= var(1)

[State -1, Puddle]
type = ChangeState
value =6012
triggerall=stateno!=40
;triggerall = enemynear(0), movetype != H
triggerall = numhelper(6001) = 0
triggerall = stateno != 6008
triggerall = stateno != 6009
triggerall = stateno != 6000
triggerall = stateno != 6001
triggerall = stateno != 6005
triggerall = stateno != 6002
triggerall=command!="b"
triggerall = command != "holdup"
triggerall = command != "holdfwd"
triggerall = command != "holdback"
triggerall = command = "buffer_c"&& command="holddown"
triggerall = StateType != A
trigger1 = statetype != A
trigger1 = ctrl
trigger2= var(1)

[State -1, Puddle]
type = ChangeState
value =6017
triggerall=stateno!=40
;triggerall = enemynear(0), movetype != H
triggerall = numhelper(6001) = 0
triggerall = stateno != 6008
triggerall = stateno != 6009
triggerall = stateno != 6000
triggerall = stateno != 6001
triggerall = stateno != 6005
triggerall = stateno != 6002
triggerall=command!="b"
triggerall = command != "holdup"
triggerall = command = "holdfwd"
triggerall = command != "holdback"
triggerall = command = "buffer_c"&& command="holddown"
triggerall = StateType != A
trigger1 = statetype != A
trigger1 = ctrl
trigger2= var(1)

[State -1, Puddle]
type = ChangeState
value =6018
triggerall=stateno!=40
;triggerall = enemynear(0), movetype != H
triggerall = numhelper(6001) = 0
triggerall = stateno != 6008
triggerall = stateno != 6009
triggerall = stateno != 6000
triggerall = stateno != 6001
triggerall = stateno != 6005
triggerall = stateno != 6002
triggerall=command!="b"
triggerall = command != "holdup"
triggerall = command != "holdfwd"
triggerall = command = "holdback"
triggerall = command = "buffer_c"&& command="holddown"
triggerall = StateType != A
trigger1 = statetype != A
trigger1 = ctrl
trigger2= var(1)

;============================================================================================


[State -1, nB: (Air) Acid Bubble]
type = ChangeState
value =6013
;triggerall = enemynear(0), movetype != H
;triggerall = Pos Y < -12
triggerall = var(11)<=1
triggerall = stateno!=40
triggerall = numhelper(6001) = 0
triggerall = command != "holdback"
triggerall = command != "holdfwd"
triggerall = command != "holdup"
triggerall=command!="b"
triggerall = command != "holddown"
triggerall = command = "buffer_c" 
triggerall = StateType = A
trigger1 = ctrl
trigger2= movecontact && (stateno = [600,650));&& enemynear, movetype = H
trigger3 = stateno=1061||stateno=1062
trigger3=!moveguarded

[State -1, nB: (Air) D Acid Bubble]
type = ChangeState
value =6014
;triggerall = enemynear(0), movetype != H
;triggerall = Pos Y < -12 
triggerall = var(11)<=1
triggerall = stateno!=40
triggerall = numhelper(6001) = 0
triggerall = command != "holdback"
triggerall = command != "holdfwd"
triggerall = command != "holdup"
triggerall=command!="b"
triggerall = command = "buffer_c" && command = "holddown"
triggerall = StateType != S
triggerall = StateType = A
trigger1 = ctrl
trigger2= movecontact && (stateno = [600,650));&& enemynear, movetype = H 
trigger3 = stateno=1061||stateno=1062
trigger3=!moveguarded

[State -1, nB: (Air) B Acid Bubble]
type = ChangeState
value =6015
;triggerall = enemynear(0), movetype != H
;triggerall = Pos Y < -12
triggerall = var(11)<=1
triggerall = stateno!=40
triggerall = numhelper(6001) = 0
triggerall = command != "holddown"
triggerall = command != "holdfwd"
triggerall = command != "holdup"
triggerall=command!="b"
triggerall = command = "buffer_c" && command = "holdback"
triggerall = StateType != S
triggerall = StateType = A
trigger1 = ctrl
trigger2= movecontact && (stateno = [600,650)); enemynear, movetype = H
trigger3 = stateno=1061||stateno=1062
trigger3=!moveguarded

[State -1, nB: (Air) F Acid Bubble]
type = ChangeState
value =6016
;triggerall = Pos Y < -20 
triggerall = var(11)<=1
triggerall = stateno!=40
triggerall = numhelper(6001) = 0
triggerall = command != "holdback"
triggerall = command != "holddown"
triggerall = command != "holdup"
triggerall=command!="b"
triggerall = command = "buffer_c" && command = "holdfwd"
triggerall = StateType = A
trigger1 = ctrl
trigger2= movecontact && (stateno = [600,650));&& enemynear, movetype = H
trigger3 = stateno=1061||stateno=1062
trigger3=!moveguarded


;--------------------------------------------------------------------------------------------------------------------------

;[State -1, nB: Acid Bubble]
;type = ChangeState
;value =6013
;triggerall = enemynear(0), movetype != H
;triggerall = var(11)<=0
;triggerall = numhelper(6001) != 1
;triggerall = numhelper(6005) != 1
;triggerall = numhelper(6002) != 1
;triggerall = stateno != 6000
;triggerall = stateno != 6001
;triggerall = stateno != 6005
;triggerall = stateno != 6002
;triggerall = command != "holddown"
;triggerall = command != "holdback"
;triggerall = command != "holdfwd"
;triggerall = command != "holdup"
;triggerall = command = "buffer_c"
;triggerall = StateType != S
;trigger1 = StateType = A
;trigger1 = ctrl
;trigger2= var(1)



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
triggerall = stateno!=45 && stateno!=46 && stateno!= 4260 && (stateno!=[4000,4099])
triggerall = var(45)>0
triggerall = var(29)>0
triggerall = stateno!=640
triggerall=prevstateno!=640
trigger1 = ctrl && stateno!=45 && stateno!=46 && stateno!=50 && stateno!=40 && stateno!= 4260
trigger2 = movecontact ;&& enemynear, movetype = H
trigger2 =  hitdefattr = A, NA
trigger3 = stateno=45 || stateno=46|| stateno=50
trigger3 = vel y>.1
trigger4 = stateno = 640 && movehit =1
[State -1,DJC]
type = ChangeState
value = 45
triggerall = statetype=A
triggerall = command = "holdupb"
triggerall = stateno!=45 && stateno!=46 && stateno!= 4260 && (stateno!=[4000,4099])
triggerall = var(45)>0
triggerall = var(29)>0
triggerall = stateno=640||prevstateno=640
trigger1 = movehit

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
trigger2 = stateno = 1051 || stateno = 1061 || stateno = 1066
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
trigger2 = stateno = 1051 || stateno = 1061 || stateno = 1066
trigger2 = movehit

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
value =  750
triggerall=stateno!=100
triggerall=stateno!=40
trigger1 = statetype != A
triggerall = command = "y"
triggerall = command = "holdfwd"
triggerall = command !="holddown"
triggerall = command !="holdup"
trigger1 = ctrl
trigger2 = (stateno = 200) ;&& movecontact && enemynear, movetype = H 
trigger3 = (stateno = 210) ;&& movecontact && enemynear, movetype = H 
trigger4 = stateno = 230 ;&& movecontact && enemynear, movetype = H 
trigger5 = (stateno = 400) ;&& movecontact && enemynear, movetype = H 
trigger6 = stateno = 410 ;&& movecontact && enemynear, movetype = H 
trigger7 = stateno = 215 ;&& movecontact && enemynear, movetype = H  
trigger8 = stateno = 101 

;4L
[State -1,4L]
type = ChangeState
value =  200
triggerall=stateno!=40
triggerall = command = "x"
triggerall = command = "holdback"
triggerall = command != "holddown"
triggerall = stateno !=200
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact ;&& enemynear, movetype = H  
trigger3 = stateno = 400 && movecontact
trigger4 = stateno = 100

;5L
[State -1,5L]
type = ChangeState
value =  210
triggerall=stateno!=40
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact ;&& enemynear, movetype = H  
trigger3 = stateno = 100
trigger4 = (stateno = 400) && movecontact && prevstateno!=210

;5M
[State -1,5M]
type = ChangeState
value =  215
triggerall=stateno!=40
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact 
trigger3 = stateno = 100
trigger4 = stateno = 210 && movecontact 
trigger5 = stateno = 400 && movecontact 
trigger6 = (stateno = 410) && movecontact && prevstateno!=215

;4H
[State -1,4H]
type = ChangeState
value = 223
triggerall=stateno!=40
triggerall = command = "z"
triggerall = command = "holdback"
triggerall = command != "holddown"
triggerall = stateno !=223
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 410) || (stateno = 210)  || (stateno = 200) || (stateno = 420) ||stateno = 215 ||stateno = 220
trigger2 = (movecontact)

;5H
[State -1, 5H]
type = ChangeState
value =  220
triggerall=stateno!=40
triggerall = statetype != A
triggerall = command = "z"
triggerall = command != "holddown"
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact && enemynear, movetype = H
trigger3 = (stateno = 210) && movecontact && enemynear, movetype = H
trigger4 = (stateno = 410) && movecontact && enemynear, movetype = H
trigger5 = (stateno = 420) && movecontact && prevstateno!=220
trigger6 = (stateno = 215) && movecontact && enemynear, movetype = H



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
trigger2 = stateno = 200 
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 100
trigger4 = (stateno = 210) && movecontact && prevstateno!=400
trigger5 = (stateno = 400) && movecontact
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
trigger2 = (stateno = 400) || (stateno = 200)  || (stateno = 210)
trigger2 = (movecontact) ;&& enemynear, movetype = H
trigger3 = stateno = 100
trigger4 = (stateno = 215) && movecontact && prevstateno!=410
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
trigger2 = (stateno = 400) || (stateno = 410)|| (stateno = 200)|| (stateno = 210)|| (stateno = 215)
trigger2 = (movecontact) ;&& enemynear, movetype = H
trigger3 = stateno = 100
trigger4 = (stateno = 220) && movecontact && prevstateno!=420

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
trigger2 = (stateno = 400) || (stateno = 410) || (stateno = 210)  || (stateno = 200) || (stateno = 420) ||stateno = 215
trigger2 = (movecontact) ;&& enemynear, movetype = H
trigger3 = stateno = 100
trigger4 = stateno = 105

;-----------------------------------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------------------------------

;jL
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = stateno!=40
triggerall = command = "x"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 
trigger2 = movehit ;&& enemynear, movetype = H
trigger3 = stateno = 1350 ;Air blocking
trigger4 = stateno = 610 && movehit
trigger5 = stateno = 630 && movehit

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
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1350 ;Air blocking
trigger4 = stateno = 630 && movehit

;---------------------------------------------------------------------------
;jH
[State -1, jH]
type = ChangeState
value = 630
triggerall = stateno!=40
triggerall = command != "holddown"
triggerall = command = "buffer_z"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = (stateno = [600,610]) 
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1350 ;Air blocking

;---------------------------------------------------------------------------
;j3H
[State -1, jH]
type = ChangeState
value = 640
triggerall = stateno!=40
triggerall = command = "buffer_z"
triggerall = command = "holddown" && command= "holdfwd"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = (stateno = [600,630]) 
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1350 ;Air blocking
triggerall = pos y<-20

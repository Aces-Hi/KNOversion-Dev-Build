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
trigger2 = stateno!=421
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 105
var(1) = 1

[State -1, Combo condition Check]
type = ChangeState
value = 45
triggerall = statetype = A
triggerall = command = "holdup"
triggerall = map(djump)=0
trigger1 = hitdefattr = A, NA
trigger1 = movecontact
trigger2 = ctrl
trigger2= map(resetj)<=3
;===========================================================================
;===========================================================================
;===========================================================================
;=============================LVL1-LVL3 SUPERS===============================
;===========================================================================
;===========================================================================
;===========================================================================

;SUPER1: Buster Horizon
[State -1, BH]
type = ChangeState
value = 3000
triggerall = command = "QCF"
triggerall = power >= 2000
trigger1 = ctrl
triggerall = statetype != A
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3000,3050)
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = var(1)
;---------------------------------------------------------------------------
;SUPER2: RAGE
[State -1, R]
type = ChangeState
value = 4001
triggerall=map(assist)=0
triggerall = command = "QCB"
triggerall = power >= 2000
trigger1 = ctrl
triggerall = statetype != A
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3000,3050)
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = var(1)
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

;===========================================================================
;===========================================================================
;===========================================================================
;=============================SPECIALS & EX==================================
;===========================================================================
;===========================================================================
;===========================================================================

[State -1, 6S: EX Flurry]
type = ChangeState
value = 2050
triggerall = map(EX6)=0
triggerall = power>=1000
triggerall = command = "holdfwd"
triggerall = command = "EX"
triggerall=stateno!=431
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno =1000 || stateno =2000 || stateno =2070 || stateno =2074 || stateno =2000 || stateno =1051|| stateno =1052|| stateno =1054 || stateno =1001|| stateno =704  || stateno =703
trigger3 = movecontact

[State -1, 6S: Flurry]
type = ChangeState
value = 2000
triggerall = command != "EX"
triggerall = command != "FDF" 
triggerall = command = "b"
triggerall = command != "c"
triggerall = command = "holdfwd"
triggerall = statetype != A
triggerall=stateno!=431
trigger1 = ctrl
trigger2 = var(1)

[State -1, 4S: Primal Rampage]
type = ChangeState
value = 1050
triggerall = command != "FDF" 
triggerall = command = "b" && command="holdback"
triggerall = command != "EX"
triggerall=stateno!=431
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)

[State -1, EX 4S]
type = ChangeState
value = 1055
triggerall = map(EX4)=0
triggerall = power>=1000
triggerall = command = "EX" && command="holdback"
triggerall=stateno!=431
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno =1000 || stateno =2000 || stateno =2070 || stateno =2074 || stateno =2000 || stateno =1051|| stateno =1052|| stateno =1054 || stateno =1001|| stateno =704  || stateno =703
trigger3 = movecontact

[State -1, J2S: Acid Stomp]
type = ChangeState
value = 2073
triggerall = command != "EX"
triggerall = command = "b"
triggerall = command = "holddown"
triggerall = command != "holdback"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=[600,630]
trigger3=movecontact

[State -1, EX J2S]
type = ChangeState
value = 2075
triggerall = map(EXj2)=0
triggerall = power>=1000
triggerall = command = "EX"
triggerall = command = "holddown"
triggerall = command != "holdback"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=[600,630]
trigger3=movecontact
[State -1, 2S: Acid Stomp]
type = ChangeState
value = 2070
triggerall = command != "EX"
triggerall = command != "FDF" 
triggerall = command = "b"
triggerall = command = "holddown"
triggerall = command != "holdback"
triggerall = statetype != A
triggerall=stateno!=431
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno=700

[State -1, EX2S]
type = ChangeState
value = 2071
triggerall = map(EX2)=0
triggerall = power>=1000
triggerall = command != "FDF" 
triggerall = command = "EX"
triggerall = command = "holddown"
triggerall = command != "holdback"
triggerall = statetype != A
triggerall=stateno!=431
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno =1000 || stateno =2000 || stateno =2070 || stateno =2074 || stateno =2000 || stateno =1051|| stateno =1052|| stateno =1054 || stateno =1001|| stateno =704  || stateno =703
trigger3 = movecontact
trigger4 = stateno=700

[State -1, 5S: EX Upper]
type = ChangeState
value = 1002
triggerall = map(EX5)=0
triggerall = power>=1000
triggerall = command = "EX"
triggerall = command != "holdback" 
triggerall = command != "holddown" 
triggerall = command != "holdfwd" 
triggerall=stateno!=431
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno =1000 || stateno =2000 || stateno =2070 || stateno =2074 || stateno =2000 || stateno =1051|| stateno =1052|| stateno =1054 || stateno =1001|| stateno =704  || stateno =703
trigger3 = movecontact

[State -1, 5S: Upper]
type = ChangeState
value = 1000
triggerall = command = "b"
triggerall = command != "FDF" 
triggerall = command != "holdback" 
triggerall = command != "holddown" 
triggerall = command != "holdfwd" 
triggerall = command != "EX"
triggerall=stateno!=431
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)

[State -1, 5S: Upper]
type = ChangeState
value = 1000
triggerall = command = "FDF" 
triggerall = map(EWGF)>4
triggerall=stateno!=431
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)

[State I'M NOT GONNA SUGARCOAT IT]
type = ChangeState
value = 1001
triggerall = command = "FDF" 
triggerall = map(EWGF)<=4
triggerall=stateno!=431
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)


;===========================================================================
;===========================================================================
;===========================================================================
;=============================BREAKER ATK==================================
;===========================================================================
;===========================================================================
;===========================================================================

[State -1, 2R]
type = ChangeState
value = 700
triggerall = map(roll)=0
triggerall = stateno != 700
triggerall = prevstateno != 700
triggerall = command="holddown"
triggerall = command = "c"
triggerall = command != "b"
triggerall=stateno!=431
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
triggerall = stateno != 105

[State -1, 5R]
type = ChangeState
value = 701
triggerall = stateno != 701
triggerall = command!="holdback"
triggerall = (command!="holddown"&&map(roll)=0)||map(roll)>0
triggerall = command = "c"
triggerall = command != "b"
triggerall=stateno!=431
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
triggerall = stateno != 105

[State -1, 4R]
type = ChangeState
value = 702
triggerall = stateno != 702
triggerall = command!="holdfwd" 
triggerall = command!="holddown"
triggerall = command="holdback" && command = "c"
triggerall = command != "b"
triggerall=stateno!=431
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
triggerall = stateno != 105

;============================================================================================

;===========================================================================
;===========================================================================
;===========================================================================
;===============================MOVEMENT==================================
;===========================================================================
;===========================================================================
;===========================================================================

;Forward Dash
[State -1, Run!!]
type = ChangeState
value = 100
triggerall = stateno!=105
triggerall = stateno!=100
triggerall = command = "FF" || (command = "dash"&&teammode!=tag) || (command = "dash"&&teammode=tag && partner,stateno=5150)
triggerall = command != "holdback"
triggerall = stateno!=651
trigger1 = statetype != A
trigger1 = ctrl

;Backdash
[State -1, Backdash]
type = ChangeState
value = 105
triggerall = command = "BB" || (command = "dash"&&teammode!=tag) || (command = "dash"&&teammode=tag && partner,stateno=5150)
triggerall = command = "holdback"
triggerall = stateno!=651
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


;===========================================================================
;===========================================================================
;===========================================================================
;================================STRINGS====================================
;===========================================================================
;===========================================================================
;===========================================================================

[state -1, Forward L > M]
type = changestate
triggerall = statetype != A
value = 201
triggerall = command = "x"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact 
trigger3 = stateno = 400 && movecontact 

[state -1, Enryu Haibi Follow]
type = changestate
triggerall = command = "y"
triggerall = command != "holddown"
triggerall = command != "holdfwd"
triggerall = command != "holdback"
triggerall = stateno = 201 && statetype != A
trigger1 = time > 11
value = 202

;Overhead
[State -1, Stand Strong Punch]
type = ChangeState
value =  750
triggerall=stateno!=100
triggerall=stateno!=40
trigger1 = statetype !=A
triggerall = command = "y"
triggerall = command = "holdfwd"
triggerall = command !="holddown"
triggerall = command !="holdup"
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact 
trigger3 = (stateno = 210) && movecontact 
trigger4 = stateno = 411 && movecontact
trigger5 = (stateno = 400) && movecontact 
trigger6 = stateno = 410 && movecontact
trigger7 = stateno = 211 && movecontact
trigger8 = stateno = 201 && movecontact


;===========================================================================
;===========================================================================
;===========================================================================
;================================NORMALS==================================
;===========================================================================
;===========================================================================
;===========================================================================

;5L
[State -1, 5L]
type = ChangeState
value = 200
triggerall = command = "x"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = command = "x"
trigger2 = movecontact
trigger2 = (stateno = 400)&&movecontact
trigger2 = prevstateno!=200&&prevstateno!=700
trigger3 = stateno = 100

[state -1, Enryu Haibi Follow]
type = changestate
triggerall = command != "holddown"
triggerall = command = "x"
triggerall = stateno = 200 && statetype != A
trigger1 = time > 5
trigger2 = movecontact
value = 203


;4M
[State -1, 5H]
type = ChangeState
value =  212
triggerall = stateno != 212
triggerall = statetype != A
triggerall = command = "y"
triggerall = command = "holdback"
triggerall = command != "holddown"
trigger1 = ctrl
trigger2 = stateno=410||stateno=400
trigger2 = prevstateno!=700&&movecontact
trigger3 = stateno=200||stateno=210||stateno=202||stateno=203||stateno=201
trigger3=movecontact

;5M
[State -1,5M]
type = ChangeState
value =  210
triggerall = command = "y"
triggerall = command != "holdback"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno=410||stateno=400
trigger2 = prevstateno!=700&&movecontact
trigger2 = prevstateno!=210&&movecontact
trigger3 = stateno=200||stateno=202||stateno=203
trigger3=movecontact


[state -1, Enryu Haibi Follow]
type = changestate
triggerall = command != "holddown"
triggerall = command != "holdback"
triggerall = command = "y"
triggerall = stateno = 210 && statetype != A
trigger1 = time > 22
trigger2=movecontact
value = 211

;4H
[State -1, 5H]
type = ChangeState
value =  222
triggerall = statetype != A
triggerall = command = "z"
triggerall = command = "holdback"
triggerall = command != "holddown"
trigger1 = ctrl
trigger2 = stateno=410||stateno=400||stateno=420
trigger2 = prevstateno!=700&&movecontact
trigger3 = stateno=200||stateno=202||stateno=203||stateno=220||stateno=212||stateno=210||stateno=201
trigger3=movecontact



;5H
[State -1, 5H]
type = ChangeState
value =  220
triggerall = statetype != A
triggerall = command = "z"
triggerall = command != "holddown"
triggerall = command != "holdback"
triggerall = command != "holdfwd"
trigger1 = ctrl
trigger2 = stateno=410||stateno=400||stateno=420
trigger2 = prevstateno!=700&&movecontact
trigger2 = prevstateno!=220&&movecontact
trigger3 = stateno=200||stateno=202||stateno=203||stateno=212||stateno=210||stateno=201
trigger3=movecontact

;6H
[State -1, 6H]
type = ChangeState
value =  221
triggerall = statetype != A
triggerall = command = "z"
triggerall = command != "holddown"
triggerall = command = "holdfwd"
trigger1 = ctrl
trigger2 = stateno=410||stateno=400||stateno=420
trigger2 = prevstateno!=700&&movecontact
trigger3 = stateno=200||stateno=202||stateno=203||stateno=220||stateno=212||stateno=210||stateno=201
trigger3=movecontact

;-----------------------------------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------------------------------

;2L
[State -1, 2L]
type = ChangeState
value = 400
triggerall = command = "x"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 400&&prevstateno!=700&&movecontact
trigger3 = stateno=200&&movecontact&&prevstateno!=400
trigger4 = stateno=700

;---------------------------------------------------------------------------
;2M
[State -1, 2M]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno=400||stateno=210
trigger2 = prevstateno!=700&&movecontact
trigger2 = prevstateno!=410&&movecontact
trigger3 = stateno=200||stateno=202||stateno=203||stateno=201
trigger3=movecontact
trigger4 = stateno=700
;---------------------------------------------------------------------------
;2H
[State -1, 2H]
type = ChangeState
value = 420
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = command != "holdfwd"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno=410||stateno=400||stateno=220
trigger2 = prevstateno!=700&&movecontact
trigger2 = prevstateno!=420&&movecontact
trigger3 = stateno=200||stateno=202||stateno=203||stateno=212||stateno=210||stateno=201
trigger3=movecontact
trigger4 = stateno=700

;---------------------------------------------------------------------------
;3H
[State -1, 3H]
type = ChangeState
value = 431
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = command = "holdfwd"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno=410||stateno=400||stateno=420
trigger2 = prevstateno!=700&&movecontact
trigger3 = stateno=200||stateno=202||stateno=203||stateno=212||stateno=210||stateno=220||stateno=201
trigger3=movecontact
trigger4 = stateno=700
;-----------------------------------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------------------------------

;jL
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = command = "x"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 &&movehit
trigger2 = movecontact
trigger3 = stateno = 1350 ;Air blocking
trigger5 = stateno = 610 &&movehit
trigger4 = stateno = 630&&movehit
;---------------------------------------------------------------------------
;jM
[State -1, jM]
type = ChangeState
value = 610
triggerall = command = "y"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 &&movecontact
trigger2 = movecontact
trigger3 = stateno = 1350 ;Air blocking
trigger4 = stateno = 630&&movecontact


;---------------------------------------------------------------------------
;jH
[State -1, jH]
type = ChangeState
value = 630
triggerall = command != "holddown"
triggerall = command = "z"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = (stateno = [600,610]) &&movecontact
trigger2 = movecontact
trigger3 = stateno = 1350 ;Air blocking
;---------------------------------------------------------------------------


;---------------------------------------------------------------------------
;Jumping d+SK
[State -1, Fast Kung Fu Palm]
type = ChangeState
value = 650
triggerall = command = "holddown"
triggerall = command = "z"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600&&movecontact
trigger3 = stateno = 610&&movecontact
trigger4 = stateno = 630&&movecontact
trigger5 = stateno = 640&&movecontact

[state -1, Enryu Haibi Follow]
type = changestate
triggerall = ifelse(p2dist X> 0, command = "holddown", command = "holddown")
triggerall = ifelse(p2dist X> 0, command = "z", command = "z")
triggerall = stateno = 5004 && statetype != A
trigger1 = movehit
value = 650


;==================================================

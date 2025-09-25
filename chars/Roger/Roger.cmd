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
trigger3 = stateno = 1310 || (stateno = 1330&&ctrl)
trigger4 = stateno = 105
var(1) = 1



;---------------------------------------------------------------------------
;Triple Kung Fu Palm (uses one super bar)
[State -1, Triple Kung Fu Palm]
type = ChangeState
value = 3000
triggerall = command = "TripleKFPalm"
triggerall = power >= 2000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3000,3050)
trigger2 = movecontact
trigger3 = stateno = 1310 || (stateno = 1330&&ctrl)
trigger4 = stateno = 616
trigger5 = stateno = 10003 ||stateno =40016
trigger6 = stateno = 1405||stateno =1458
trigger7 = var(1)
;---------------------------------------------------------------------------
;Triple Kung Fu Palm (uses one super bar)
[State -1, Triple Kung Fu Palm]
type = ChangeState
value = 3051
triggerall = command = "SmashKFUpper"
triggerall = power >= 2000
triggerall = stateno !=3050 && var(30)<=0
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3000,3050)
trigger2 = movecontact
trigger3 = stateno = 1310 || (stateno = 1330&&ctrl)
trigger4 = stateno = 616
trigger5 = stateno = 10003 ||stateno =40016
trigger6 = stateno = 1405||stateno =1458
trigger7 = var(1)
;===========================================================================

[State -1,DJC]
type = ChangeState
value = 45
triggerall = statetype=A
triggerall = stateno!=40
triggerall = stateno!=1330
triggerall = command = "holdupb"
triggerall = stateno!=45 && stateno!=46 && stateno!= 434 && (stateno!=[4000,4099])
triggerall = var(45)>0
;triggerall = var(29)>0
trigger1 = ctrl && stateno!=45 && stateno!=46 && stateno!=50 && stateno!=40 && stateno!= 434
trigger2 = movecontact  && enemynear, movetype = H
trigger2 = hitdefattr = A, NA
trigger3 =  stateno=45 || stateno=46|| stateno=50
trigger3 = vel y>.1

[State -1, Grab]
type = ChangeState
value = 800
triggerall=stateno!=40
trigger1 = command = "throwtech"
trigger1 = statetype != A
trigger1 = ctrl

[State -1, Magma Viper EX]
type = ChangeState
value = 1450
triggerall=stateno!=40
triggerall = power>=1000
triggerall = command = "EX"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
triggerall = statetype != A
triggerall = fvar(24) = 0
trigger1 = ctrl
trigger2 = var(1)
trigger3 = (stateno = [600,640]) 
trigger3 = movecontact


[State -1, Magma Viper]
type = ChangeState
value = 1400
triggerall=stateno!=40
triggerall = command = "b"
triggerall = command != "c"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = (stateno = [600,640]) 
trigger3 = movecontact

[State -1, EX Meteor Drop]
type = ChangeState
value = 1350
triggerall=stateno!=40
triggerall = power>=1000
triggerall = map(exdrop)=0
triggerall = command = "EX"
triggerall = command = "holddown"
triggerall = command != "holdback"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)


[State -1, Meteor Drop]
type = ChangeState
value = 1300
triggerall=stateno!=40
triggerall = command = "b"
triggerall = command != "c"
triggerall = command = "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)


[State -1, EX Flare Press]
type = ChangeState
value = 10050
triggerall=map(EXLimiter1)=0
triggerall=stateno!=40
triggerall = power>=1000
triggerall = var(31)<=0
triggerall = fvar(21) = 0
triggerall = command = "EX"

triggerall=command="holdback"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)

[State -1, Flare Press]
type = ChangeState
value = 1100
triggerall=stateno!=40
triggerall = command = "b" && command="holdback"
triggerall = command != "holddown"
triggerall = command != "EX"
triggerall = var(51)<=0
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)

;---------------------------------------------------------------------------
[State -1, Air Gentle Upper EX]
type = ChangeState
value = 1325
triggerall = stateno!=40
triggerall = power>=1000
triggerall = var(32)<=0
triggerall = command = "EX"
triggerall = fvar(23) = 0
triggerall = statetype = A
trigger1 = ctrl
trigger2 = (stateno = [600,640]) 
trigger2 = movecontact
trigger3 = stateno = 1350 ;Air blocking
trigger4 = var(1)
;---------------------------------------------------------------------------
[State -1, Air Gentle Upper]
type = ChangeState
value = 1320
triggerall = stateno!=40
triggerall = command = "b"
triggerall = command != "EX"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = (stateno = [600,640]) 
trigger2 = movecontact
trigger3 = stateno = 1350 ;Air blocking
trigger4 = var(1)
;---------------------------------------------------------------------------
[State -1, EX Dynamo Slapper]
type = ChangeState
value = 4001
triggerall=stateno!=40
triggerall = power>=1000
triggerall = fvar(20) = 0
triggerall = command = "EX"
triggerall = command != "holddown"
triggerall = command != "holdfwd"
triggerall = command != "holdback"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=105


[State -1, Dynamo Slammer]
type = ChangeState
value = 1000
triggerall=stateno!=40
triggerall = command = "b"
triggerall = command != "EX"
triggerall = command != "holddown"
triggerall = command != "holdfwd"
triggerall = command != "holdback"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=105

[State -1, 2R]
type = ChangeState
value = 560
triggerall=stateno!=40
triggerall = command = "c" && command="holddown"
triggerall = command != "EX"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger2=stateno!=105

[State -1, Knuckle]
type = ChangeState
value = 550
triggerall=stateno!=40
triggerall = command = "c" && command="holdback"
triggerall = command != "EX"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger2=stateno!=105

[State -1, Clap]
type = ChangeState
value = 500
triggerall=stateno!=40
triggerall = command = "c"
triggerall = command != "EX"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger2=stateno!=105
;---------------------------------------------------------------------------

;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;Forward Dash
[State -1, Run!!]
type = ChangeState
value = 100
triggerall = stateno!=105
triggerall = stateno!=100
triggerall = stateno!=40
triggerall = stateno!=1330
triggerall = command = "FF" || (command = "dash"&&teammode!=tag) || (command = "dash"&&teammode=tag && partner,stateno=5150)
triggerall = command != "holdback"
trigger1 = statetype != A
trigger1 = ctrl
;Backdash
[State -1, Backdash]
type = ChangeState
value = 105
triggerall = stateno!=40
triggerall = stateno!=1330
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
trigger2 = (stateno = 200) && movecontact 
trigger3 = (stateno = 210) && movecontact 
trigger4 = stateno = 411 && movecontact
trigger5 = (stateno = 400) && movecontact 
trigger6 = stateno = 410 && movecontact
trigger7 = stateno = 211 && movecontact
trigger8 = stateno = 201 && movecontact
;===========================================================================
;---------------------------------------------------------------------------
[State -1, Stand Strong Punch]
type = ChangeState
value =  200
triggerall=stateno!=40
triggerall = command = "x"
triggerall = command = "holdback"
trigger1 = statetype != A
trigger1 = ctrl
;trigger2 = (stateno = 200) && movecontact

[State -1, Stand Strong Punch]
type = ChangeState
value =  201
triggerall=stateno!=40
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2= command = "x"
trigger2 = (stateno = 400) && movecontact && prevstateno!=201

;Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
value =  210
triggerall=stateno!=40
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 201) && movecontact
trigger3 = (stateno = 400) && movecontact
trigger4 = stateno = 200 && movecontact

[State -1, Stand Strong Punch]
type = ChangeState
value =  210
triggerall=stateno!=40
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = (prevstateno!= 210 && stateno = 410) && movecontact

[State -1, Stand Strong Punch]
type = ChangeState
value =  410
triggerall=stateno!=40
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 =  (prevstateno!= 410 && stateno = 210)  && movecontact
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 201 && movecontact



;Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
value =  220
triggerall=stateno!=40
trigger1 = statetype != A
triggerall = command = "z"
triggerall = command != "holddown"
trigger1 = ctrl
trigger2 = (stateno = 201) && movecontact
trigger3 = (stateno = 210 || stateno=211)&& movecontact
trigger4 = (stateno = 410 || stateno=411) && movecontact
trigger5 = (stateno = 420) && movecontact &&prevstateno!=220




;---------------------------------------------------------------------------
;Crouching Light Punch
[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerall=stateno!=40
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 200)
trigger2 = movecontact
trigger3 = (stateno = 201) && movecontact && prevstateno!=400&& prevstateno!=200
;---------------------------------------------------------------------------
;Crouching Strong Punch
[State -1, Crouching Strong Punch]
type = ChangeState
value = 410
triggerall=stateno!=40
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 400) 
trigger2 = (movecontact)
;---------------------------------------------------------------------------
;Crouching Light Kick
[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerall=stateno!=40
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = command = "holdfwd"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 200)|| (stateno = 210)|| (stateno = 410)|| (stateno = 420)|| (stateno = 211)
trigger2 = (movecontact)

;---------------------------------------------------------------------------
;Crouching Light Kick
[State -1, Crouching Light Kick]
type = ChangeState
value = 420
triggerall=stateno!=40
triggerall = command = "z"
triggerall = command = "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 200)|| (stateno = 210)|| (stateno = 410) || (stateno = 211) || (stateno = 411)
trigger2 = (movecontact)

;---------------------------------------------------------------------------
;Jump Light Punch
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = stateno!=40
triggerall = command = "x"
triggerall = statetype = A
trigger1 = ctrl
;trigger2 = movecontact && stateno = 600
trigger2 = stateno = 1350 ;Air blocking
trigger3 = stateno = 100
trigger4 = stateno = 615 && movehit
trigger5 = stateno = 610 && movehit
trigger6 = stateno = 600 && movehit
;---------------------------------------------------------------------------

;Jump Strong Punch
[State -1, Jump Strong Punch]
type = ChangeState
value = 610
triggerall = stateno!=40
triggerall = command = "buffer_y"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 601  ;jump_x or jump_a
trigger2 = movecontact
trigger3 = stateno = 1350 ;Air blocking
trigger4 = stateno = 100
trigger5 = stateno = 615 && movehit
;---------------------------------------------------------------------------
;Jump Strong Kick
[State -1, Jump Strong Kick]
type = ChangeState
value = 615
triggerall = stateno!=40
triggerall = command = "buffer_z"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = (stateno = [600,610]) 
trigger2 = movecontact
trigger3 = stateno = 1350 ;Air blocking
trigger4 = stateno = 100
;---------------------------------------------------------------------------
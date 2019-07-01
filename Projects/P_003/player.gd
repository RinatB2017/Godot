extends RigidBody2D

var anim=""
var siding_left=false
var jumping=false
var stopping_jump=false

var WALK_ACCEL = 500.0
var WALK_DEACCEL= 1800.0
var WALK_MAX_VELOCITY= 400.0
var GRAVITY = 700.0
var AIR_ACCEL = 300.0
var AIR_DEACCEL= 300.0
var JUMP_VELOCITY=460
var STOP_JUMP_FORCE=200.0

var MAX_FLOOR_AIRBORNE_TIME = 0.15

var airborne_time=1e20

var floor_h_velocity=0.0

func _integrate_forces(s):

	var lv = s.get_linear_velocity()
	var step = s.get_step()
	
	var new_anim=anim
	var new_siding_left=siding_left

# Get the controls
	var move_left = Input.is_action_pressed("move_left")
	var move_right = Input.is_action_pressed("move_right")
	var jump = Input.is_action_pressed("jump")

#deapply prev floor velocity
	lv.x-=floor_h_velocity
	floor_h_velocity=0.0

# Find the floor (a contact with upwards facing collision normal)
	var found_floor=false
	var floor_index=-1
	
	for x in range(s.get_contact_count()):
		var ci = s.get_contact_local_normal(x)
		if (ci.dot(Vector2(0,-1))>0.6):
			found_floor=true
			floor_index=x

	if (found_floor):
		airborne_time=0.0 
	else:
		airborne_time+=step #time it spent in the air

	var on_floor = airborne_time < MAX_FLOOR_AIRBORNE_TIME
# Process jump
	if (jumping):
		if (lv.y>0):
#set off the jumping flag if going down
			jumping=false
		elif (not jump):
			stopping_jump=true

		if (stopping_jump):
			lv.y+=STOP_JUMP_FORCE*step
	if (on_floor):
# Process logic when character is on floor
		if (move_left and not move_right):
			if (lv.x > -WALK_MAX_VELOCITY):
				lv.x-=WALK_ACCEL*step			
		elif (move_right and not move_left):
			if (lv.x < WALK_MAX_VELOCITY):
				lv.x+=WALK_ACCEL*step
		else:
			var xv = abs(lv.x)
			xv-=WALK_DEACCEL*step
			if (xv<0):
				xv=0
			lv.x=sign(lv.x)*xv
		#Check jump
		if (not jumping and jump):
			lv.y=-JUMP_VELOCITY
			jumping=true
			stopping_jump=false
		#check siding
		if (lv.x < 0 and move_left):
			new_siding_left=true
		elif (lv.x > 0 and move_right):
			new_siding_left=false
		if (jumping):
			new_anim="jumping"	
		elif (abs(lv.x)<0.1):
			new_anim="idle"
		else:
			new_anim="run"
	else:
# Process logic when the character is in the air
		if (move_left and not move_right):
			if (lv.x > -WALK_MAX_VELOCITY):
				lv.x-=AIR_ACCEL*step			
		elif (move_right and not move_left):
			if (lv.x < WALK_MAX_VELOCITY):
				lv.x+=AIR_ACCEL*step
		else:
			var xv = abs(lv.x)
			xv-=AIR_DEACCEL*step
			if (xv<0):
				xv=0
			lv.x=sign(lv.x)*xv
			
		if (lv.y<0):
			new_anim="jumping"
		else:
			new_anim="falling"
#Update siding
	if (new_siding_left!=siding_left):
		if (new_siding_left):
			get_node("sprite").set_scale( Vector2(-1,1) )
		else:
			get_node("sprite").set_scale( Vector2(1,1) )
			
		siding_left=new_siding_left
#Change animation
	if (new_anim!=anim):
		anim=new_anim
		get_node("anim").play(anim)
# Apply floor velocity
	if (found_floor):
		floor_h_velocity=s.get_contact_collider_velocity_at_pos(floor_index).x
		lv.x+=floor_h_velocity
#Finally, apply gravity and set back the linear velocity
	lv+=s.get_total_gravity()*step
	s.set_linear_velocity(lv)
extends CharacterBody3D
 
func _physics_process(delta):
	if not is_on_floor(): 
		velocity.y = -.1
	else:
		velocity.y = 0 

	if Input.is_action_just_pressed("rotate-x-cw"): 
		self.rotate_x( -PI / 2)
	elif Input.is_action_just_pressed("rotate-x-ccw"): 
		self.rotate_x(PI / 2)
	
	if Input.is_action_just_pressed("rotate-y-cw"):
		self.rotate_y(- PI / 2)
	elif Input.is_action_just_pressed("rotate-y-ccw"):
		self.rotate_y(PI / 2)
	
	if Input.is_action_just_pressed("rotate-z-cw"): 
		self.rotate_z(- PI / 2)
	elif Input.is_action_just_pressed("rotate-z-ccw"): 
		self.rotate_z(PI / 2)

	if Input.is_action_just_pressed("move_forward"):
		pass
	elif Input.is_action_just_pressed("move_backward"):
		pass
	if Input.is_action_just_pressed("move_left"):
		pass
	elif Input.is_action_just_pressed("move_right"): 
		pass
	move_and_slide()

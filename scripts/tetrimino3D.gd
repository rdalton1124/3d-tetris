extends CharacterBody3D

func _physics_process(delta):
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

	move_and_slide()

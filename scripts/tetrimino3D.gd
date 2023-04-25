extends CharacterBody3D
@onready var root = get_parent()
@onready var spwner = $"../Spawner"


func _ready():
	print("Tetrimino ready called")
	
func _physics_process(delta):
	if not is_on_floor(): 
		velocity.y = -.25
	else:
		velocity.y = 0 
		root.spawn()
		set_physics_process(false)

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
		self.position.z -= .4
	elif Input.is_action_just_pressed("move_backward"):
		pass
	if Input.is_action_just_pressed("move_left"):
		pass
	elif Input.is_action_just_pressed("move_right"): 
		pass
	move_and_slide()
